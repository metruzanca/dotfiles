HISTSIZE=50000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history
EDITOR=code

# alt+arrow -> move between words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

autoload -Uz compinit && compinit
# TODO linux path for brew isn't here
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(starship init zsh)"

if [ -x "$(command -v direnv)" ]; then 
  eval "$(direnv hook zsh)"
fi

# Plugins
function load_plugin {
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

if load_plugin "$HOMEBREW_PREFIX/share/zsh-abbr/zsh-abbr.zsh"; then
  # abbr import-aliases;
fi
# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
