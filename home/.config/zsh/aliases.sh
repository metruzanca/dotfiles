#!/usr/bin/env bash
#shellcheck disable=SC2155,SC2059

alias ls=lsd -a
alias dot='$EDITOR $HOME/dotfiles'
cd() { builtin cd "$@" && ls; }

# Cool, it works! But I don't think I'll need it.
# rgb() { printf "\033[38;2;${1:-0};${2:-0};${3:-0}m"; } # 8-bit color
function calc {
    echo "$@" | bc
}