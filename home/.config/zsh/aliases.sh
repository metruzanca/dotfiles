#!/usr/bin/env bash
#shellcheck disable=SC2155,SC2059

alias dot='$EDITOR $HOME/dotfiles'

# If lsd is installed use that
if [ -x "$(command -v lsd)" ]; then 
  alias ls="lsd"
fi

# if lsd is aliased to ls above, this will use lsd instead.
cd() { builtin cd "$@" && ls; }

# Cool, it works! But I don't think I'll need it.
# rgb() { printf "\033[38;2;${1:-0};${2:-0};${3:-0}m"; } # 8-bit color
function calc {
    echo "$@" | bc
}
function notify {
    osascript -e "display notification \"$*\""
}

# use T to log to stderr then pipe into pbcopy
alias otp='echo $TOTP_TOKEN | totp-cli instant | pbcopy'