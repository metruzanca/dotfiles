# ---------- Variables ----------
export nvm_default_version="v16.18.1"
export EDITOR="code-insiders"
export C="/mnt/c"

# source $HOME/.config/fish/env.fish

if type -q bass
    bass source $HOME/.config/fish/functions.sh
    bass source $HOME/.config/fish/is_wsl.sh
end

# export USERWINDOWS=(powershell.exe '$env:UserName')

# ---------- Aliases ----------

# TODO on next windows install, windows username and
# wsl username should be identical (case sensitive)

# Since alacritty is installed on the host machine
abbr c "$EDITOR"
abbr w "cd /mnt/c/Users/samue/"

# Projects
abbr dot "$EDITOR ~/dev/dotfiles"
abbr z "$EDITOR /mnt/c/Users/samue/Documents/zanca.dev-quartz"

if test $isWSL
    abbr winget "winget.exe"
end

if type -q lsd
    abbr ls lsd
end

alias trim="awk '{\$1=\$1;print}'"

# ---------- Initializations ----------

# Rust
fish_add_path $HOME/.cargo/bin
# . "$HOME/.cargo/env"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Volta
# Volta

# Add homebrew to path
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# ---------- Fish Shell configuration ----------

function fish_greeting
  # This function empty silences the default message
  # macchina
end


if type -q lsd
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

# ---- Starship ----

if type -q starship
    starship init fish | source
end


# direnv
if type -q direnv
    direnv hook fish | source
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Golang
# Update go e.g. https://tecadmin.net/how-to-install-go-on-ubuntu-20-04/
# set -gx GOPATH "$HOME/go"
set -gx PATH "/usr/local/go/bin" $PATH

# SurrealDB
set -gx PATH "$HOME/.surrealdb" $PATH

# Fly.io
set -gx FLYCTL_INSTALL "$HOME/.fly"
set -gx PATH "$FLYCTL_INSTALL/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opam configuration
source /home/szanca/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
