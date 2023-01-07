HISTSIZE=50000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history

autoload -Uz compinit && compinit
# autoload -Uz promptinit && promptinit

eval "$(starship init zsh)"
