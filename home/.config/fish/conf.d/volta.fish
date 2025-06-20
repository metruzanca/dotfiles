# Macos needs this added to PATH
if test $os = "Darwin" && type -q volta
    fish_add_path "/Users/$username/.volta/bin"
end