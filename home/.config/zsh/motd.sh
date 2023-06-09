#!/usr/bin/env bash
# shellcheck disable=SC2155,SC2059,SC2120

format_time() {
  hours=$1
  minutes=$2

  if [[ $hours -eq 0 ]]; then
    echo "${minutes}mins"
  elif [[ $minutes -eq 0 ]]; then
    echo "${hours}hrs"
  else
    echo "${hours}hrs ${minutes}mins"
  fi
}

time_left() {
  local now=$(date +%s)
  local target=$(date -j -f "%H:%M" "$1" +%s)
  local diff=$(($target - $now))

  format_time $((diff / 3600)) $(((diff / 60) % 60))
}

between() {
  local time=$1
  local start=$2
  local end=$3

  if [[ $time > $start && $time < $end ]]; then
    return 0
  else
    return 1
  fi
}

can_deploy() {
  ranges=("$@")
  local red=$(tput setaf 1)
  local bold=$(tput bold)
  local reset=$(tput sgr0)
  local orange=$(tput setaf 3)
  local green=$(tput setaf 2)
  local day=$(date +%A)
  if [ "$day" = "Friday" ]; then
    printf "${bold}${orange}TGIF! ${red}No Deploys${reset} until Monday\n"
    return 0;
  else
    local now=$(date +%H:%M)
    for (( i=0; i<${#ranges[@]}; i+=2 )); do
      if between "$now" "${ranges[@]:$i:2}"; then
        printf "${red}$(time_left "${ranges[$i+2]}")${reset} left to ${green}deploy!${reset}\n"
        return 0;
      fi
    done
  fi
  printf "${red}No more deploys${reset}\n"
}

days_since() {
  # Get the starting date from the first argument
  local start_date=$1

  # Calculate the number of seconds between the starting date and now
  local start_seconds=$(date -j -f "%Y-%m-%d" "$start_date" +%s)
  local now_seconds=$(date +%s)
  local diff_seconds=$((now_seconds - start_seconds))

  # Calculate the number of days between the starting date and now
  echo $((diff_seconds / 86400 + 1))
}

weekends_since() {
  # Get the starting date from the first argument
  local start_date=$1

  # Calculate the number of seconds between the starting date and now
  local start_seconds=$(date -j -f "%Y-%m-%d" "$start_date" +%s)
  local now_seconds=$(date +%s)
  local diff_seconds=$((now_seconds - start_seconds))

  # Calculate the number of days between the starting date and now
  echo $(((diff_seconds / 86400 / 7) * 2))
}

motd() {
  can_deploy \
    "08:00" "11:30" \
    "13:30" "16:00";
  
  # "2023-06-07" is the start of sprint 113
  local SPRINT_DATE="2023-06-07"

  local sprint_start=$(days_since $SPRINT_DATE)
  local weekend_days=$(weekends_since $SPRINT_DATE)
  print "Sprint day $(((sprint_start - weekend_days) % 10)) of 10"

}