if type -q zoxide;
    zoxide init fish | source;
    abbr cd z;

    # Open zoxide query result in VSCode
    function zc
        zoxide query "$argv" | xargs code
    end
end