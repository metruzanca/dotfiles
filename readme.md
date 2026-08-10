# Dotfiles

My configuration files, powered by gnu stow.

## Setup

Clone this repo in your home directory.

> [!note]
> Install `stow` command
>
> ```bash
> brew install stow
> sudo pacman -S stow
> sudo apt install stow
> ```

```bash
git submodule update --init --recursive;
stow home
# On macos only
stow macos
```


```bash
# Change shell
which fish | sudo tee -a /etc/shells >/dev/null;
chsh -s "$(which fish)";
```

## SSH keys

`~/.ssh` is **not** stowed (it contains private keys), but `authorized_keys`
is populated from GitHub so any machine can pull its keys from the same place:

```bash
umask 077
mkdir -p ~/.ssh

tmp=$(mktemp)
curl -fsSL https://github.com/metruzanca.keys > "$tmp"
install -m 600 "$tmp" ~/.ssh/authorized_keys
rm "$tmp"

chmod 700 ~/.ssh
```

`sshd` already allows pubkey auth by default (`PubkeyAuthentication yes`), so
no daemon restart is needed after adding keys.

## Dev servers over the tailnet (WSL)

This box runs WSL2 with **mirrored networking** (`networkingMode=mirrored` in
`.wslconfig`), and Tailscale runs on the Windows host — WSL shares the host's
network stack, including the Tailscale interface. Two ways to reach a WSL dev
server from another tailnet device:

### Direct port access with Vite `--host` (recommended)

Tailscale is a layer-3 mesh: any node can reach any other node's
`hostname:port` directly, no `serve` needed. Vite dev servers only need to
bind the network interface:

```bash
vdev            # == bun run dev -- --host  (bare --host = 0.0.0.0)
```

Then from any tailnet device:

- `http://100.85.182.44:<port>` — Vite allows IP hosts by default, no config.
- `http://desktop.tailf04e0e.ts.net:<port>` — hostname access; covered by
  `__VITE_ADDITIONAL_SERVER_ALLOWED_HOSTS=".ts.net"` in
  `home/.config/fish/conf.d/vite.fish`.

Findings:

- There is **no Vite env var** for host binding — only `--host` (CLI) or
  `server.host` (config). The only Vite dev-server env var is
  `__VITE_ADDITIONAL_SERVER_ALLOWED_HOSTS` (checked against Vite 8.1.4).
- Tradeoff: binding `0.0.0.0` also exposes the port on the LAN, and the short
  MagicDNS name (`http://desktop:3000`) is host-blocked — use the IP or full
  ts.net name.

### HTTPS URL with `tailscale serve`

If you want a clean `https://` URL (auto TLS cert, path routing) instead of
raw port access, use serve on the Windows host via the `tailscale` fish helper
(which wraps the Windows CLI through PowerShell):

```bash
tailscale serve --bg <port>     # https://desktop.tailf04e0e.ts.net/ -> 127.0.0.1:<port>
tailscale serve --https=443 off # stop
tailscale serve status
```

- `--bg` runs persistently and auto-resumes after reboot.
- Requires HTTPS to be enabled in the tailnet (the CLI opens a consent page on
  first use).
- The app stays bound to `localhost`; tailscaled does the exposing.

## File Structure

```bash
.
├── home      # Home directory for all
├── macos     # MacOS specific directories
├── windows   # Windows specific directories (need to manually symlink)
└── scripts   # Helpful scripts
```

---

## Future Improvements

- Look into https://www.chezmoi.io
