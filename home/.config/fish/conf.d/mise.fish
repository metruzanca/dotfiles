set -gx MISE_ALL_COMPILE 0

if type -q mise
  mise activate fish | source
end
