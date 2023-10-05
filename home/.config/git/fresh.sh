#!/usr/bin/env bash
#shellcheck disable=SC2059
# ^ I like printf formatting

reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
pink=$(tput setaf 5)
bold=$(tput bold)

if [ -z "$1" ]; then
  printf "${red}Error: No argument provided.${reset}\n\n";
  printf "Usage: git fresh <branch-name> - deletes the branch locally and checks out the remote version.\n";
  exit 1;
fi

target="$1"

# A fucking lambda in bash mfs. Sick.
current_branch() { git rev-parse --abbrev-ref HEAD; }

# if current branch is target, checkout master. This is needed because you get
# an error if you try to delete a branch you're currently on
if [ "$(current_branch)" = "$target" ]; then
  master="$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)"
  git checkout "$master" &>/dev/null;
fi

git branch -D "$target" &>/dev/null;
git checkout "$target" &>/dev/null;

# Generally when this command fails, it endes up on master and not $1.
if [ "$(current_branch)" = "$target" ]; then
  printf "Checked out a ${green}${bold}fresh${reset} version of ${pink}${bold}${target}${reset} from remote.\n"
fi