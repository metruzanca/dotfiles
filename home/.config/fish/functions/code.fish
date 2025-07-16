# Function to open vscode using zoxide for directory navigation
if type -q zoxide
    function code
        if test (count $argv) -eq 0
            echo "Usage: code <zoxide_argument>"
            return 1
        end

        set -l cmd "code"
        if test (uname) = "Darwin"
            set -l cmd 'open -a "Visual Studio Code"'
        end

        if test "$argv[1]" = "."
            pwd | xargs "$cmd"
            return 0
        end

        zoxide query "$argv[1]" | xargs "$cmd"
    end
end

# alias code="zoxide query $1 | xargs open -a \"Visual Studio Code\""