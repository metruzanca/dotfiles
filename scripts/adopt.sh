#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

input_path="$1"

# Expand ~ to $HOME if present
expanded_path="${input_path/#\~/$HOME}"
# Remove $HOME/ prefix to get relative path
relative_path="${expanded_path/#$HOME\//}"
echo "$relative_path"

mkdir -p "$(dirname "$HOME/$relative_path")"
mv "$HOME/$relative_path" "$HOME/dotfiles/home/$relative_path"
stow home