# Fish shell abbreviations

# Very basic approximation of line of code count in a git repository
abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'
# Cd to the root of the git repository or stay in the current directory if not in a git repo
abbr cdg 'cd $(git rev-parse --show-toplevel || echo .)'


abbr c '$EDITOR .'

# Default flags for common commands
abbr mkdir 'mkdir -p'
abbr rm 'rm -r'

# Golang specific abbreviations
if type -q go
  ## I keep writing got when going fast so let's make it an abbreviation
  abbr got "CI=\"true\" go test -v ./... -json | tparse -all"
  abbr gog "go generate ./..."
end
