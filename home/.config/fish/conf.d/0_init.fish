# Fish evaluates this folder by filename order, so 0_init.fish runs before everything else.
# Brew should be initialized before anything else, so we can use all packages easily from PATH
# ---------- Homebrew setup ----------
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
  fish_add_path /opt/homebrew/opt/uutils-coreutils/libexec/uubin
end

if test -f /home/linuxbrew/.linuxbrew/bin/brew
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fish_add_path /home/linuxbrew/.linuxbrew/opt/uutils-coreutils/libexec/uubin
end

# ---------- Cargo apps setup ----------
if test -f "$HOME/.cargo/env.fish"
  source "$HOME/.cargo/env.fish"
end

# ---------- Default Environment Variables ----------
# This fish file gets loaded first, so we can set default env vars here
# the $HOME/.config/fish/config.fish file can override these if needed
set -gx EDITOR "zed --wait"
