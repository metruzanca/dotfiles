#! /bin/bash

alias ls=lsd
cd() { builtin cd "$@" && ls; }
# Like pbcopy but without the trailing new-line
alias clipboard="tr -d '\n' | pbcopy"

jira-branch() {
    if [ -z "$1" ]; then
        echo "Usage: jira-branch <jira url> [dash-spaced-description]"
        return 1
    fi
    branch_name=$(echo "$1" | awk -F'/' '{print $NF}')
    if [ -n "$2" ]; then
        branch_name="$branch_name-$2"
    fi
    git checkout -b "$branch_name"
}

alias dot='$EDITOR $HOME/dotfiles'
