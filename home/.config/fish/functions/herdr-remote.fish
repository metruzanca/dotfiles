function herdr-remote --description 'Attach to a remote Herdr session over SSH'
    if not type -q herdr
        printf 'herdr is not installed\n' >&2
        return 127
    end

    set -l host desktop
    if test (count $argv) -ge 1
        set host $argv[1]
    end

    herdr --remote $host
end
