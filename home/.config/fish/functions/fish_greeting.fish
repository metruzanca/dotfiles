function fish_greeting
    if type -q pfetch
        if test "$TERM_PROGRAM" = "vscode"
            return
        end
        pfetch
    end
end
