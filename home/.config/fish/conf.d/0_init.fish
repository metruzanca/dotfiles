# Fish evaluates this folder by filename order, so 0_init.fish runs before everything else.
# Brew should be initialized before anything else, so we can use all packages easily from PATH
# ---------- Homebrew setup ----------
for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew
  if test -f $brew_prefix/bin/brew
    eval ($brew_prefix/bin/brew shellenv)
    fish_add_path $brew_prefix/opt/uutils-coreutils/libexec/uubin
    fish_add_path $brew_prefix/opt/libpq/bin
    break
  end
end

# I have a lot of cargo installed apps, if this isn't here their configs might not load e.g. lsd.fish
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# ---------- Default Environment Variables ----------
# This fish file gets loaded first, so we can set default env vars here
# the $HOME/.config/fish/config.fish file can override these if needed
set -gx EDITOR "zed --wait"
