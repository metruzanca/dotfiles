---
name: tailscale
description: Use when the user says "tailscale" or "tail skill", or wants a local dev server or app reachable from other devices on their Tailscale network ("tailnet") via MagicDNS: changing the bind address to 0.0.0.0, allowing the tailnet hostname or origin in a dev server / CORS / ALLOWED_HOSTS config, or finding the MagicDNS URL another device should use. Not for general Tailscale setup or networking questions that don't involve exposing a local service.
---

# tailscale

Short answer for most requests: bind the server to `0.0.0.0` (not
`127.0.0.1`), then open `http://<hostname>:<port>` from the other device. The
rest of this file is the detail for when that is not enough.

Make a local dev server reachable from other devices on the user's Tailscale
network using MagicDNS names. Do not start by asking questions: run the
commands in step 0, pick the matching rows from the cheat sheets, apply the
changes, and verify with step 4.

## Why this is needed

Tailscale is a userspace WireGuard stack: it routes packets addressed to the
node's tailnet IP, but it does NOT reach into `127.0.0.1` on behalf of remote
peers. An app bound to loopback is only reachable on the machine itself. Two
things must be true for another device to connect:

1. The app listens on `0.0.0.0` (or `::`), not `127.0.0.1`.
2. Nothing in between (OS firewall, host/Origin validation, CORS) rejects the
   tailnet hostname.

## Step 0 — identify the machine and its tailnet name

Run `hostname` to learn which machine hosts the dev server, and
`tailscale status` to confirm the tailnet node name (usually the hostname).

Access URLs for other devices:

- Short name (works when the client has MagicDNS on):
  `http://<hostname>:<port>`
- Fully qualified:
  `http://<hostname>.<magicdns-suffix>.ts.net:<port>`

The user's tailnet suffix is `tailf04e0e.ts.net` and the node names are the
device hostnames (`nixos`, `m5air`, `rasp`, ...). Use the short name by
default. If the client can't resolve it, MagicDNS is off on that device — tell
the user to enable it, or fall back to the node's `100.x.x.x` tailnet IP from
`tailscale status`.

## Step 1 — bind to 0.0.0.0

Find where the server sets its host first (`package.json` scripts,
`vite.config.*`, `next.config.*`, `docker-compose.yml`, the
`uvicorn`/`flask`/`cargo run` invocation) and change it there, so the fix
survives the next restart. Set the listener to all interfaces. Framework cheat
sheet:

| Framework / runtime | Change |
|---|---|
| Vite | `server: { host: "0.0.0.0" }` in `vite.config.ts`, or run `vite --host 0.0.0.0` |
| Next.js | `next dev -H 0.0.0.0` (or `--hostname 0.0.0.0`); also see `allowedDevOrigins` below |
| uvicorn (FastAPI) | `uvicorn app:app --host 0.0.0.0 --port 8000` |
| Flask | `flask run --host 0.0.0.0` |
| Bun | `Bun.serve({ hostname: "0.0.0.0", port: 8000, fetch })` |
| Go net/http | `http.ListenAndServe(":8000", mux)` (empty host = all interfaces) |
| axum / actix / Rocket | bind `0.0.0.0:8000` (axum: `TcpListener::bind("0.0.0.0:8000")`) |
| Gleam wisp / lustre | set the host/address to `0.0.0.0` in the server config |
| dotnet | `dotnet run --urls http://0.0.0.0:8000` |
| Generic | `HOST=0.0.0.0` env var if the framework reads it |

Prefer the framework's own option over a generic env var. Preserve the port the
user already uses.

## Step 2 — allow the tailnet host/origin where the server validates it

Some servers reject requests whose Host header or Origin isn't in an allowlist.
When connecting from a browser or when the server 403s on an unknown host, add
the tailnet names.

- **Vite (6.1+)** blocks unknown Host headers. In `vite.config.ts`:
  `server.allowedHosts: ["<hostname>", "<hostname>.tailf04e0e.ts.net"]`
  (or `true` to disable the check).
- **Next.js dev** — `allowedDevOrigins: ["<hostname>", "<hostname>.tailf04e0e.ts.net"]`
  in `next.config.*`.
- **Django** — add the names to `ALLOWED_HOSTS`.
- **CORS (browser apps):** if a page served from one dev server (e.g.
  `http://nixos:5173`) calls an API on another port, the browser sends an
  `Origin: http://nixos:5173` header and the API must allow it. Add the exact
  origin(s) to the CORS allowlist (FastAPI `CORSMiddleware(allow_origins=[...])`,
  flask-cors, Go gorilla/handlers-cors, etc.). Origin includes scheme and port:
  `http://<hostname>:<port>`.

## Step 3 — firewall / platform

- **`nixos` (Linux, NixOS):** the firewall trusts `tailscale0`
  (`networking.firewall.trustedInterfaces`), so every port is open to the
  tailnet — no action needed. LAN/Wi-Fi and the internet stay blocked.
- **`m5air` (macOS):** ensure the macOS application firewall
  (System Settings > Network > Firewall) is off or allows the app. macOS has
  no per-interface firewall managed by nix-darwin.
- **Other machines / non-managed setups:** open the port or trust the tailnet
  interface in the OS firewall if inbound connections fail.

## Step 4 — verify

From another tailnet device:

```
curl http://<hostname>:<port>
```

If it returns the app's response, done. Debug order: hostname resolution
(MagicDNS) → app reachable (`ss -tlnp` or `lsof -iTCP -sTCP:LISTEN` shows it
listening on `0.0.0.0:<port>`) → firewall on the host.

## Safety

- Keep databases, message queues, admin panels, and anything unauthenticated
  bound to `127.0.0.1`. Only expose what the user means to expose.
- Binding `0.0.0.0` also makes the port reachable on the LAN on machines
  without a firewall; on `nixos` the firewall keeps LAN access closed.
- Anyone on the tailnet can reach anything bound to `0.0.0.0`. Prefer the
  app-level auth over relying on network obscurity.