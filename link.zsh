#!/usr/bin/env zsh
# shellcheck disable=SC1071

if [ ! -x "$(command -v stow)" ]; then
  echo "GNU stow not installed".
  return 1;
fi

try_stow() {
  if [ -d "$1" ]; then
    stow "$1";
  fi
}

run_on() {
  if [ "$(uname)" = "$1" ]; then
    shift; # Removes first argument from the list
    "$@";
  fi
}

stow home;
run_on Darwin stow macos;
try_stow "private";

# The following need to be run after stowing to make sure new files are present

# If espanso is installed, restart it
if [ -x "$(command -v espanso)" ]; then 
  espanso restart
fi

# If zplug is installed, install plugins
if [ -d "/opt/homebrew/opt/zplug" ]; then
  source /opt/homebrew/opt/zplug/init.zsh;
  source $HOME/.config/zsh/.plugins.zsh
  zplug install;
fi


# TODO macos settings sync.
# # Convert plist xml to binary
# # plutil -convert binary1 file.plist
# # Convert binary to plist xml
# # plutil -convert xml1 file.plist

# if [ "$(uname)" = "Darwin" ]; then
#   # # Convert Plist preferences files to binary.
#   # for file in $HOME/.config/**/*.plist; do
#   #   # plutil -convert binary1 "$file";
#   #   echo "$file"
#   # done
#   for file in os/macos/defaults/*; do
#     # defaults write $file "$(cat "$file")"
#     echo $file
#   done
# fi
