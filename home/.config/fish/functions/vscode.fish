
function vscode
  set -l cmd (which code)
  $cmd "$argv"
end
