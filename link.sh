#!/usr/bin/env bash

if [ -x "$(command -v espanso)" ]; then 
  stow home;
  
  if [ -d "private" ]; then
    stow private;
  fi
else
  echo "GNU stow not installed".
fi

if [ -x "$(command -v espanso)" ]; then 
  espanso restart
fi
