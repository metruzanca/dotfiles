#!/usr/bin/env zsh
# shellcheck disable=1071

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
  source /opt/homebrew/opt/zplug/init.zsh;
  source $HOME/.config/zsh/.plugins.zsh
  zplug install;
fi

# Convert plist xml to binary
# plutil -convert binary1 file.plist
# Convert binary to plist xml
# plutil -convert xml1 file.plist

if [ "$(uname)" = "Darwin" ]; then
  # # Convert Plist preferences files to binary.
  # for file in $HOME/.config/**/*.plist; do
  #   # plutil -convert binary1 "$file";
  #   echo "$file"
  # done
  for file in os/macos/defaults/*; do
    # defaults write $file "$(cat "$file")"
    echo $file
  done
fi
