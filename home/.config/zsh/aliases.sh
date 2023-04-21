#! /bin/bash

alias ls=lsd -a
cd() { builtin cd "$@" && ls; }
# Like pbcopy but without the trailing new-line
alias clipboard="tr -d '\n' | pbcopy"
alias silent=">/dev/null 2>&1"

jira-branch() {
    if [ -z "$1" ]; then
        printf "Usage: jira-branch <jira url> [dash-spaced-description]\n\n"
        printf "Examples: jira-branch https://jira.example.com/browse/ABC-123\n"
        printf "          jira-branch https://jira.example.com/browse/ABC-123 \"some-description\"\n\n"
        return 1
    fi
    branch_name=$(echo "$1" | awk -F'/' '{print $NF}')
    if [ -n "$2" ]; then
        branch_name="$branch_name-$2"
    fi
    git checkout -b "$branch_name"
}

alias dot='$EDITOR $HOME/dotfiles'
