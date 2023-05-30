#!/usr/bin/env bash
#shellcheck disable=SC2155,SC2059

jira() {
    local command_name='jira'
    local green=$(tput setaf 2)
    local reset=$(tput sgr0)
    local bold=$(tput bold)
    local red=$(tput setaf 1)

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

    # Function to remember what this does
    function trim { sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'; }

    # If a branch for that ticket already exists, check it out
    local existing=$(git branch | grep -m 1 "$branch_name" | trim)
    if [ -n "$existing" ]; then
        echo "${red}Found existing branch${reset} - Checking out: $existing"
        git checkout "$existing"
        return 0
    fi

    # Optionally add description
    if [ -n "$2" ]; then
        branch_name="$branch_name-$2"
    fi
    git checkout -b "$branch_name"
}

git-checkout-clean() {
    local reset=$(tput sgr0)
    local red=$(tput setaf 1)
    local green=$(tput setaf 2)
    local pink=$(tput setaf 5)
    local bold=$(tput bold)
    if [ -z "$1" ]; then
        printf "${red}Error: No argument provided.${reset}\n\n";
        printf "Usage: git-checkout-clean <branch-name> - deletes the branch locally and checks out the remote version.\n";
        return 1;
    fi
    
    git stash;
    git checkout "$(git master)" &>/dev/null;
    git branch -D "$1" &>/dev/null;
    git checkout "$1" &>/dev/null;

    # Generally when this command fails, it endes up on master and not $1.
    if [ "$(git rev-parse --abbrev-ref HEAD)" = "$1" ]; then
        printf "Checked out a ${green}${bold}fresh${reset} version of ${pink}${bold}${1}${reset} from remote.\n"
    fi
}