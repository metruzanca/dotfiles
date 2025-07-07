# Macos needs this added to PATH
if test (uname) = "Darwin" && type -q volta
    fish_add_path "/Users/(whoami)/.volta/bin"
end

if test -d "$HOME/.volta/bin"
    set -gx VOLTA_HOME "$HOME/.volta"
    set -gx PATH "$VOLTA_HOME/bin" $PATH
end