# https://github.com/max-sixty/worktrunk
# https://x.com/max_sixty/status/2006077845391724739
if type -q wt;
  command wt config shell init fish | source; 

  abbr wtc "wt switch -c -x cursor-agent metru/"
  abbr wts "wt switch"
  abbr wtr "wt remove"
end
