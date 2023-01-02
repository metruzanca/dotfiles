#!/bin/bash

# I don't remember where I got this from -Sam

# This script symlinks everything from $TOPATH (default: ./dotfiles/) into
# $FROMPATH (default: $HOME). Anything that would be overwritten is copied into
# $BACKUP (default: $FROMPATH/backup/).

# Basically you put your dotfiles in ./dotfiles/, in the same structure they
# were in relative to $HOME. Then if you want to edit your .bashrc (for
# example) you just edit ~/.bashrc, and as it's a symlink it'll actually edit
# dotfiles/.bashrc. Then you can add and commit that change.

# I don't have this file -Sam
# . $(dirname $0)/helpers/colours.sh # Load helper script from dot/helpers.


: ${FROMPATH:="$HOME"} # Where you keep your dotfiles, overwrite if necessary.
: ${BACKUP:="$FROMPATH/backup"} # Place to back up old files.
mkdir -p "$BACKUP"

if [ -z "$TOPATH" ]; then
  cd "$(dirname $0)/home/" || return
else
  cd "$TOPATH" || return
fi
: ${TOPATH:="$PWD"}

printf ">>> Updating dotfile symlinks (linking from path: $TOPATH)\n\n"

for FILE in $(find . -type f -o -type l | sed 's|./||'); do
  mkdir -p "$FROMPATH/$(dirname $FILE)"
  if [ -d "$FROMPATH/$FILE" ] && [ ! -L "$FROMPATH/$FILE" ]; then # Directory.
    printf "${RED}DIRSKIP: $FROMPATH/$FILE is a directory!${NC}\n" # This shouldn't happen.
  continue
  elif [ -L "$FROMPATH/$FILE" ]; then # Symlink.
    if [ "$(ls -l $FROMPATH/$FILE | awk '{print $NF}')" = "$TOPATH/$FILE" ]; then
      printf "${BBLACK}SKIP: $FROMPATH/$FILE already points to $TOPATH/$FILE.${NC}\n"
      continue
    fi
    printf "CHANGE: $FROMPATH/$FILE $(ls -l $FROMPATH/$FILE | awk '{print $NF}') -> $TOPATH/$FILE\n"
    mkdir -p "$BACKUP/$(dirname $FILE)"
    rm "$FROMPATH/$FILE" "$BACKUP/$FILE"
  elif [ -e "$FROMPATH/$FILE" ]; then # File.
    printf "MOVE: $FROMPATH/$FILE exists, moving to $BACKUP/$FILE\n"
    mkdir -p "$BACKUP/$(dirname $FILE)"
    mv "$FROMPATH/$FILE" "$BACKUP/$FILE"
  else # Nothing there.
    printf "LINK: $FROMPATH/$FILE -> $TOPATH/$FILE\n"
  fi
  ln -s "$TOPATH/$FILE" "$FROMPATH/$FILE"
done

# Clean up backup folder if empty
[ "$(ls -A "$BACKUP")" ] || rm -r "$BACKUP"


# # TODO improve this
# # If WSL
# if [[ "$(grep microsoft /proc/version)" ]]; then
#   cp "$TOPATH/.config/espanso/match/base.yml" "/mnt/c/Users/Metru/AppData/Roaming/espanso/match/base.yml"
# fi
