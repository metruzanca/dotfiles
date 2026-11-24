# worktrunk abbreviations
# https://github.com/max-sixty/worktrunk
if type -q wt;
  set -l date (date "+%b-%d" | string lower)

  abbr wtc "wt switch -c -x opencode zanca/$date-"
  abbr wts "wt switch"
  abbr wtr "wt remove"
end
