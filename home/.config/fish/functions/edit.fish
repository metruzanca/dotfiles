# Function to open the default $EDITOR using zoxide for directory navigation
if type -q zoxide
    function edit
        if test (count $argv) -eq 0
            echo "Usage: edit <zoxide_argument>"
            return 1
        end

        set -l cmd "$EDITOR"
        # This trick opens vscode much faster on macOS
        if test "$EDITOR" = "code"; and test (uname) = "Darwin"
            set -l cmd 'open -a "Visual Studio Code"'
        end

        if test "$argv[1]" = "."
            pwd | xargs "$cmd"
            return 0
        end

        zoxide query "$argv[1]" | xargs "$cmd"
    end
end
