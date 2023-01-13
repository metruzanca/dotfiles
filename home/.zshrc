HISTSIZE=50000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history

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

if load_plugin "$HOMEBREW_PREFIX/share/zsh-abbr/zsh-abbr.zsh"; then
  # abbr import-aliases;
fi