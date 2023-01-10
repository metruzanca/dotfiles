#! /usr/bin/env bash

if_installed() {
  if [ -x "$(command -v "$1")" ]; then 
    eval "$1 ${*:2}"
  fi
}

