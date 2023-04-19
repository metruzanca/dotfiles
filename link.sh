#!/usr/bin/env bash

if [ ! -x "$(command -v stow)" ]; then
  echo "GNU stow not installed".
  return 0;
fi

try_stow() {
  if [ -d "$1" ]; then
    stow "$1";
  fi
}

stow home;
try_stow "private";

# The following need to be run after stowing to make sure new files are present

if [ -x "$(command -v espanso)" ]; then 
  espanso restart
fi

if [ -d "/opt/homebrew/opt/zplug" ]; then
  zsh -c '
    source /opt/homebrew/opt/zplug/init.zsh;
    source $HOME/.config/zsh/.plugins.zsh
    zplug install;
  ';

  if [ -x "$(command -v abbr)" ]; then 
    abbr c;
    abbr import-aliases;
  fi
fi
