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
  now=$(date +%s)
  target=$(date -j -f "%H:%M" ${1:-"16:00"} +%s)

  if [[ $now -lt $target ]]; then
    diff=$(($target - $now))
    hours=$(($diff / 3600))
    minutes=$((($diff / 60) % 60))    
    # format_time "$hours $minutes"

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

motd() {
  ranges=(
    "8:00" "11:30"
    "1:30" "16:00"
  )
  # if between any range, return time left
  # else return no more deploys today
  local red=$(tput setaf 1)
  local bold=$(tput bold)
  local reset=$(tput sgr0)
  local orange=$(tput setaf 3)
  local day=$(date +%A)
  if [ "$day" = "Friday" ]; then
    printf "${bold}${orange}TGIF! ${red}No Deploys${reset} until Monday at ${ranges[0]}."
    return 0;
  else
    local now=$(date +%H:%M)
    for (( i=0; i<${#ranges[@]}; i+=2 )); do
      if between "$now" "${ranges[@]:$i:2}"; then
        printf "$(time_left "${ranges[$i+1]}") left to deploy!\n"
        return 0;
      fi
    done
  fi
  printf "${red}No more deploys${reset}\n"
}
