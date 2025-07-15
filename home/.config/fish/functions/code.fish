# Function to open vscode using zoxide for directory navigation
if type -q zoxide
    function code
        if test (count $argv) -eq 0
            echo "Usage: code <zoxide_argument>"
            return 1
        end

        set -l zoxide_arg (echo $argv[1])

        if test (uname) = "Darwin"
        	zoxide query "$zoxide_arg" | xargs open -a "Visual Studio Code"
        else
            zoxide query $zoxide_arg | xargs code
        end
    end
end

# alias code="zoxide query $1 | xargs open -a \"Visual Studio Code\""