#! /usr/bin/env bash

# TODO Needs work

installed() {
  [ -x "$(command -v $1)" ]
}

if [ "$(uname)" = "Darwin" ]; then
  source "${BASH_SOURCE%/*}/macOS.sh"
fi

if [ "$(uname)" = "Linux" ]; then
  if installed apt; then 
    source "${BASH_SOURCE%/*}/debian.sh"
  fi

fi


