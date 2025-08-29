function code
    set -l cmd "code"
    # This trick opens vscode much faster on macOS
    if test (uname) = "Darwin"
        set -l cmd 'open -a "Visual Studio Code"'
    end

    $cmd $argv
end

