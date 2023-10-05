#!/usr/bin/env bash
#shellcheck disable=SC2059
# ^ I like printf formatting

DEFAULT_BRANCH="staging"

reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
pink=$(tput setaf 5)
bold=$(tput bold)

current_branch="$(git branch --show-current)"
target="${1:-$DEFAULT_BRANCH}"

if [ "$current_branch" = "$target" ]; then
  printf "${red}Error:${reset} Please checkout the feature branch you wish you wish to stage.\n";
  printf "Usage: git stage [staging-branch-name] - Merges feature branch to latest version of staging branch (default: $DEFAULT_BRANCH\n";
  exit 1;
fi

git branch -D "$target" &>/dev/null;
git checkout "$target" &>/dev/null;
# Was having issues where fresh copy wasn't latest, so I'll just pull here.
git pull &>/dev/null;

# Generally when this command fails, it endes up on master and not $1.
if ! git merge "$current_branch"; then
  printf "${red}Error:${reset} Please resolve conflicts and proceed with merge.\n";
  exit 1;
fi

git push &>/dev/null;
printf "Merged ${current_branch} to a ${green}${bold}fresh${reset} version of ${pink}${bold}${target}${reset} from remote.\n"
git checkout "$current_branch" &>/dev/null;