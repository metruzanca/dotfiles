export EDITOR="nvim"
abbr code "code-insiders"
export WORK="$HOME/dev/chainalysis/"

# Windows/WSL
set is_wsl "$(test -f /proc/version && grep microsoft /proc/version)"
if test is_wsl
    abbr winget "winget.exe"
    abbr w "cd /mnt/c/Users/samue/"
end

if type -q lsd
    abbr ls lsd;

    # See https://github.com/rstacruz/fish-autols/ but changed to use lsd instead
    function __autols_hook --description "Auto ls" --on-event fish_prompt
        # if test "$NO_AUTO_LS" != ""
        #   return
        # end

        if test "$__autols_last" != (pwd)
            lsd
        end
        set -g __autols_last (pwd)
    end
end

if type -q starship
    starship init fish | source
end

if type -q direnv
    direnv hook fish | source
end

# Leaving this function empty, silences the default greeting
function fish_greeting
end

# ----- CLI specific variables

# Rust
fish_add_path $HOME/.cargo/bin
# . "$HOME/.cargo/env"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Golang
# To update go e.g. https://tecadmin.net/how-to-install-go-on-ubuntu-20-04/
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# SurrealDB
# set -gx PATH "$HOME/.surrealdb" $PATH

# Fly.io
# set -gx FLYCTL_INSTALL "$HOME/.fly"
# set -gx PATH "$FLYCTL_INSTALL/bin" $PATH

# bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

# Ocaml opam configuration
# source /home/szanca/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

zoxide init fish | source
abbr xk "~/Downloads/xk6-ts_v0.2.6_darwin_amd64/k6"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

