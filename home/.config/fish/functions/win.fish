# PowerShell wrapper for windows on WSL
# Usage: win <some command>
# Example: "win zed ." Will open the project as a native windows project.
if grep -q microsoft /proc/version
    function win
        powershell.exe -Command "$argv"
    end
end
