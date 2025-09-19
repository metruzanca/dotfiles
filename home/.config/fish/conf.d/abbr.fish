abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'
abbr git-fuzzy 'git log --color --date=format:"%Y-%m-%d" --format="%h - %cd - %s" | fzf --ansi --preview "git show --color {1}"'

abbr mkdir 'mkdir -p'
abbr rm 'rm -r'

# Golang
if type -q go
  ## I keep writing got when going fast so let's make it an abbreviation
  abbr got "go test ./... | grep -v '?'"
  abbr gog "go generate ./..."
end
