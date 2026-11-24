# Fish evaluates this folder by filename order, so 0_init.fish runs before everything else.
# Host-specific PATH setup lives in 01_host.fish (Homebrew on macOS, NixOS
# wrapper dirs on Linux), linked from the `macos/` or `linux/` stow package.

# I have a lot of cargo installed apps, if this isn't here their configs might not load e.g. lsd.fish
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# ---------- Default Environment Variables ----------
# This fish file gets loaded first, so we can set default env vars here
# the $HOME/.config/fish/config.fish file can override these if needed
set -gx EDITOR "zed --wait"
