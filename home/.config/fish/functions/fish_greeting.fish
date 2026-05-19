function fish_greeting
    if type -q pfetch
        if contains -- "$TERM_PROGRAM" vscode zed
            return
        end
        pfetch
    end
end
