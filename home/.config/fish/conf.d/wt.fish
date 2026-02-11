# https://github.com/max-sixty/worktrunk
# https://x.com/max_sixty/status/2006077845391724739
if type -q wt;
  command wt config shell init fish | source;


  set -l date (date "+%b-%d" | string lower)

  abbr wtc "wt switch -c -x opencode zanca/$date-"
  abbr wts "wt switch"
  abbr wtr "wt remove"
end
