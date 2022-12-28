# Rust
fish_add_path $HOME/.cargo/bin
# . "$HOME/.cargo/env"

# pnpm
set -gx PNPM_HOME "/home/metru/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Volta

# Set PATH, MANPATH, etc., for Homebrew.
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
