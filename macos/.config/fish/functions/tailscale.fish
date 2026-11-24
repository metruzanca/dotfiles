# tailscale wrapper for WSL: forwards commands to the Windows-host tailscale CLI
if grep -q microsoft /proc/version
    function tailscale
        powershell.exe -NoProfile -Command "& 'C:\Program Files\Tailscale\tailscale.exe' $argv"
    end
end
