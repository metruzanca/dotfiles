# Config for https://fly.io cli
set -gx FLYCTL_INSTALL "$HOME/.fly"
set -gx PATH "$FLYCTL_INSTALL/bin" $PATH