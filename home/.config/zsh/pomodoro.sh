#!/usr/bin/env bash

# Credit to BashBunni https://gist.github.com/bashbunni/f6b04fc4703903a71ce9f70c58345106

pomo_duration="25m"
rest_duration="5m"

# shellcheck disable=SC2139
alias work="clear && timer $pomo_duration && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

# shellcheck disable=SC2139
alias rest="clear && timer $rest_duration && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

unset pomo_duration
unset rest_duration
