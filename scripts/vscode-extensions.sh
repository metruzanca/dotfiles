#!/usr/bin/env bash

# I'm only storing the urls of VSCode extensions in a JSON file
# so that anyone viewing can quickly see what extension that is.

ext_file="$HOME/.config/Code/User/extensions.json"
base_url="https://marketplace.visualstudio.com/items?itemName="

code --list-extensions | sort | while read ext; do
  echo "{\"id\": \"$ext\", \"url\": \"$base_url$ext\"}"
done | jq -s '.' > "$ext_file"
