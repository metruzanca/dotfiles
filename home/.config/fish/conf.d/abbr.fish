abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'
abbr mkdir 'mkdir -p'
abbr rm 'rm -r'

# Golang
## I keep writing got when going fast so let's make it an abbreviation
abbr got "go test ./... | grep -v '?'"