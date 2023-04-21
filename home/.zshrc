#!/usr/bin/env zsh
# shellcheck disable=1071

HISTSIZE=50000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history
EDITOR=code

# alt+arrow -> move between words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

autoload -Uz compinit && compinit
eval "$(/opt/homebrew/bin/brew shellenv)" # Macos
# This should work for both - er.. $HOMEBREW_PREFIX isn't set on macos
# eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

eval "$(starship init zsh)"

if [ -x "$(command -v direnv)" ]; then 
  eval "$(direnv hook zsh)"
fi

# Sources files and folders of files, if they exist
function try_source {
  if test -f "$1"; then
    source $1
    return 0
  fi
  if [ -d "$1" ]; then
    # 2>/dev/null will suppress stdout from commands.
    # e.g. in this case it will _mute_ "no files inside of $1" when its empty.
    for f in $1/*; do source $f; done 2>/dev/null
    return 0
  fi
  return 1
}


# Plugin Manager - https://github.com/zplug/zplug
try_source /opt/homebrew/opt/zplug/init.zsh;
try_source $HOME/.config/zsh/.plugins.zsh
zplug load;

try_source "$HOME/.config/zsh"


# Turn Abbr into aliases
erase_keys() {
  while read -r line; do
    key=$(echo "$line" | cut -d= -f1 | tr -d '"')
    abbr erase "$key" | silent;
  done < /dev/stdin
}

# abbr c; # This doesn't work for some reason https://github.com/olets/zsh-abbr/issues/88
abbr list | erase_keys
abbr import-aliases | silent;

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"


# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end