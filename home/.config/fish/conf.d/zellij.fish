if type -q zellij
  abbr zj "zellij attach main || zellij --session main || zellij";

  if set -q ZELLIJ
  else
    zellij attach main || zellij --session main || zellij
  end
end