#!/usr/bin/env fish
echo "aaaaa"

# echo "Running in WSL: $is_wsl"
# set --local is_wsl (grep microsoft /proc/version)



if grep -q microsoft /proc/version
  # echo "Detected WSL environment"
  abbr winget "winget.exe"

  abbr docker "ps docker"

  function ps
    powershell.exe -Command "$argv"
  end
else
  # echo "Not running in WSL"
end