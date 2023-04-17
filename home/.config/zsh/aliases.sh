#! /bin/bash

alias ls=lsd
cd() { builtin cd "$@" && ls; }
# Like pbcopy but without the trailing new-line
alias clipboard="tr -d '\n' | pbcopy"
