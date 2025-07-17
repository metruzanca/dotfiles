#!/usr/bin/env fish

if test -f /proc/version
  if grep -q microsoft /proc/version
    # echo "Detected WSL environment"
    abbr winget "winget.exe"
    abbr docker "powershell docker"
    abbr w "cd /mnt/c/Users/"

    function powershell
      powershell.exe -Command "$argv"
    end
  end
end