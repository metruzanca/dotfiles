set -gx PNPM_HOME "/home/$(whoami)/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    fish_add_path "$PNPM_HOME"
end