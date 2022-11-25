# TODO on next windows install, windows username and wsl username should be identical (case sensitive)

# Since alacritty is installed on the host machine
abbr arc "$EDITOR $c/Users/Metru/AppData/Roaming/alacritty/alacritty.yml"
abbr rc "$EDITOR $c/Users/Metru/dev/dotfiles"

if test $isWSL
  abbr espanso "$EDITOR $c/Users/Metru/AppData/Roaming/espanso/match/base.yml"
end
