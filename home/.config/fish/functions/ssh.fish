function ssh
    if test (count $argv) -gt 0
        command ssh $argv
        return $status
    end

    command ssh

    if not type -q tailscale; or not type -q jq; or not command -q gum
        printf 'Tailscale, jq, and gum are required to list MagicDNS names.\n' >&2
        return
    end

    set -l devices (command tailscale status --json 2>/dev/null | command jq -r '
        .Peer[]?
        | [
            (.DNSName | rtrimstr(".") | split(".")[0]),
            .TailscaleIPs[0],
            .OS,
            (if .Online then "online" else "offline" end)
          ]
        | @tsv
    ' | sort -u)

    set -l separator (printf '\t')
    printf '%s\n' $devices | command gum table --separator "$separator" --columns=Host,IP,OS,Status --print
end
