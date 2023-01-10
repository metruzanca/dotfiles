# ---------- Variables ----------
export nvm_default_version="v16.18.1"
export EDITOR="code"
export C="/mnt/c"

if type -q bass
    bass source $HOME/.config/fish/functions.sh
    bass source $HOME/.config/fish/is_wsl.sh
end

# export USERWINDOWS=(powershell.exe '$env:UserName')

# ---------- Aliases ----------

# TODO on next windows install, windows username and
# wsl username should be identical (case sensitive)

# Since alacritty is installed on the host machine
abbr rc "$EDITOR ~/dev/dotfiles"

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
set -gx PNPM_HOME "/home/metru/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Volta

# Add homebrew to path
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# ---------- Fish Shell configuration ----------


function fish_greeting
    macchina
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
