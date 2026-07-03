function agentsmd -d "Create or prepend AGENTS.md template in current directory"
    set -l template_file (dirname (status filename))/example.agents.md

    set -l matches (find . -maxdepth 1 -iname "agents.md" ! -name "." 2>/dev/null | head -1)

    if test -z "$matches"
        cp "$template_file" AGENTS.md
        echo "Created AGENTS.md from template"
        return 0
    end

    set -l filepath (string replace "./" "" "$matches")

    if type -q gum
        gum confirm "AGENTS.md already exists. Prepend template to $filepath?"
    else
        read -l -P "AGENTS.md already exists. Prepend template to $filepath? [y/N] " confirm
        string match -rq "^(y|Y)" -- "$confirm"
    end

    if test $status -eq 0
        set -l tmpfile (mktemp)
        cp "$template_file" "$tmpfile"
        cat "$filepath" >>"$tmpfile"
        mv "$tmpfile" "$filepath"
        echo "Preprended template to $filepath"
    else
        echo "No changes made."
    end
end
