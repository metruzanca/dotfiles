#!/usr/bin/env fish

if test -f /proc/version
  if grep -q microsoft /proc/version
    # echo "Detected WSL environment"
    abbr winget "winget.exe"
    # abbr docker "powershell docker"
    abbr w "cd /mnt/c/Users/"

    # In wsl (ubuntu), the default is w3m, which is not available on windows
    # so using explorer.exe with a url opens the default browser
    set -gx BROWSER explorer.exe

    function powershell
      powershell.exe -Command "$argv"
    end
  end
end