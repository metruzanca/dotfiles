# TODO on next windows install, windows username and wsl username should be identical (case sensitive)

# Since alacritty is installed on the host machine
abbr arc "$EDITOR $c/Users/Metru/AppData/Roaming/alacritty/alacritty.yml"
abbr rc "$EDITOR ~/dev/dotfiles"

if test $isWSL
  abbr winget "winget.exe"
end
