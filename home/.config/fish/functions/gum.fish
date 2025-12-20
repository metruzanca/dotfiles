# If gum is not installed, make a noop that won't break the shell config, but warns the user
if not type -q gum
  function gum
    echo "gum not installed. Tried to use: $argv"
    echo "Please install gum: https://github.com/charmbracelet/gum"
  end
end
