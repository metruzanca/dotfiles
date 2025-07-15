# Function to open vscode using zoxide for directory navigation
if type -q zoxide
    function code
        if test (count $argv) -eq 0
            echo "Usage: code <zoxide_argument>"
            return 1
        end

        if test (uname) = "Darwin"
            zoxide query "$argv[1]" | xargs open -a "Visual Studio Code"
        else
            zoxide query "$argv[1]" | xargs code
        end
    end
end

# alias code="zoxide query $1 | xargs open -a \"Visual Studio Code\""