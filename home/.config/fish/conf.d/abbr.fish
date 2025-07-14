abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'
abbr e2e 'npm run playwright test -- --ui'