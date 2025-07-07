# Macos needs this added to PATH
if test (uname) = "Darwin" && type -q volta
    fish_add_path "/Users/(whoami)/.volta/bin"
end