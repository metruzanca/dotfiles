#!/usr/bin/env bash

if [ ! -x "$(command -v stow)" ]; then
  echo "GNU stow not installed".
  return 0;
fi

if [ -x "$(command -v espanso)" ]; then 
  espanso restart
fi

try_stow() {
  if [ -d "$1" ]; then
    stow "$1";
  fi
}

stow home;
try_stow "private";
