export nvm_default_version="v16.18.1"
export EDITOR="code"
export c="/mnt/c/"

bass source $HOME/.config/fish/isWSL.sh

# pnpm
set -gx PNPM_HOME "/home/metru/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end