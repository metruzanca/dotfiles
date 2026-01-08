# Fish shell abbreviations

# Cd to the root of the git repository or stay in the current directory if not in a git repo
abbr cdg 'cd $(git rev-parse --show-toplevel || echo .)'

# Default flags for common commands
abbr mkdir 'mkdir -p'
abbr rm 'rm -r'

# This line breaks syntax highlighting, so its at the bottom to not bother me
# Very basic approximation of line of code count in a git repository
abbr loc 'git ls-files -z | xargs -0 wc -l 2>/dev/null | awk "END {print \$1}" | awk "{printf \"%'\''d LOC\\n\", \$0}"'


abbr c 'cursor .'
abbr ca 'cursor-agent'
abbr car 'cursor-agent --resume'