HISTSIZE=50000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history
EDITOR=code

# alt+arrow -> move between words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

autoload -Uz compinit && compinit
# eval "$(/opt/homebrew/bin/brew shellenv)" # Macos
# This should work for both
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

eval "$(starship init zsh)"

if [ -x "$(command -v direnv)" ]; then 
  eval "$(direnv hook zsh)"
fi

# Plugins
function try_source {
  if test -f "$1"; then
    source $1
    return 0
  fi
  return 1
}


function source_all {
  # 2>/dev/null will suppress stdout from commands.
  # e.g. in this case it will _mute_ "no files inside of $1" when its empty.
  for f in $1/*; do source $f; done 2>/dev/null
}

source_all "$HOME/.config/zsh"
try_source "$HOME/.config/git/aliases.sh"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# pnpm
export PNPM_HOME="/Users/sam.zanca/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
