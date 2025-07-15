# ---------- Core Abbreviations ----------

if type -q lsd
    abbr ls lsd
end

if type -q zoxide
    abbr cd z
end

if type -q zellij
    abbr zj "zellij attach main || zellij --session main || zellij"
end

# ---------- Misc ----------

abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'
abbr e2e 'npm run playwright test -- --ui'