# Run a Vite project's dev server bound to the network (reachable over tailnet/LAN)
function vdev
    if type -q bun
        bun run dev -- --host
    end
end
