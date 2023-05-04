#!/usr/bin/env bash
#shellcheck disable=SC2155,SC2059

alias ls=lsd -a
cd() { builtin cd "$@" && ls; }
# Like pbcopy but without the trailing new-line
alias clipboard="tr -d '\n' | pbcopy"
alias trim="sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'"

jira() {
    local command_name='jira'
    local green=$(tput setaf 2)
    local reset=$(tput sgr0)
    local bold=$(tput bold)

    if [ -z "$1" ]; then
        printf "Create a new branch for a JIRA ticket or check out an existing one.\n\n"
        printf "${bold}Usage:${reset} \n"
        printf "    $command_name <jira url> [dash-spaced-description]\n"
        printf "${bold}Examples:${reset} \n"
        printf "    $command_name https://jira.example.com/browse/ABC-123 -> ${green}ABC-123${reset}\n"
        printf "    $command_name https://jira.example.com/browse/ABC-123 \"some-description\" -> ${green}ABC-123-some-description${reset}\n\n"
        return 1
    fi

    branch_name=$(echo "$1" | awk -F'/' '{print $NF}')

    # If a branch for that ticket already exists, check it out
    local existing=$(git branch | grep -m 1 "$branch_name" | trim)
    if [ -n "$existing" ]; then
        git checkout "$existing"
        return 0
    fi

    # Optionally add description
    if [ -n "$2" ]; then
        branch_name="$branch_name-$2"
    fi
    git checkout -b "$branch_name"
}

alias dot='$EDITOR $HOME/dotfiles'
