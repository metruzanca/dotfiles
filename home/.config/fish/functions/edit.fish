# Function to open the default $EDITOR using zoxide for directory navigation
if type -q zoxide
    function edit
        if test (count $argv) -eq 0
            echo "Usage: edit <zoxide_argument>"
            return 1
        end

        zoxide query "$argv[1]" | xargs $EDITOR
    end
end
