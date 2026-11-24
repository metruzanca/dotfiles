# Global OpenCode Rules

These rules apply to every OpenCode session on this machine.

## Writing

- Never use em dashes. Use a comma, colon, or rewrite the sentence instead.

## Dev servers

- When setting up a dev server (any local server in a dev project), always bind
  to `0.0.0.0` instead of `127.0.0.1`. This lets other Tailnet devices reach it
  remotely via MagicDNS.
