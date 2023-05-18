#!/usr/bin/env bash
# shellcheck disable=SC2155,SC2059

time_left() {
  now=$(date +%s)
  target=$(date -j -f "%H:%M" ${1:-"16:00"} +%s)

  if [[ $now -lt $target ]]; then
    diff=$(($target - $now))
    hours=$(($diff / 3600))
    minutes=$((($diff / 60) % 60))
    if [[ $hours -eq 0 ]]; then
      echo "${minutes}mins"
    elif [[ $minutes -eq 0 ]]; then
      echo "${hours}hrs"
    else
      echo "${hours}hrs ${minutes}mins"
    fi
  else
    return 1
  fi
}

# Message of the day
motd() {
  local deadline_1="11:30"
  local deadline_2="16:00"

  local red=$(tput setaf 1)
  local bold=$(tput bold)
  local reset=$(tput sgr0)
  local orange=$(tput setaf 3)
  day=$(date +%A)
  if [ "$day" = "Friday" ]; then
    printf "${bold}${orange}TGIF! ${red}No Deploys Today.${reset}"
    return 0;
  else
    if [[ $(date +%H:%M) < "$deadline_2" ]]; then
      printf "$(time_left "${deadline_2}") left to deploy!\n"
      return 0;
    elif [[ $(date +%H:%M) < "$deadline_1" ]]; then
      printf "$(time_left "${deadline_1}") left to deploy!\n"
      return 0;
    fi
  fi
  printf "${red}No more deploys today.${reset}\n"
}
