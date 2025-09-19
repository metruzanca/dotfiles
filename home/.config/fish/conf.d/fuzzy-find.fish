if type -q fzf

  if type -q bat and type -q fd
    # Fuzzy find and open files with a preview using fzf, fd, and bat
    function fzf_find_file
      command fd -t f --hidden --exclude .git . | fzf --preview 'bat --color=always {}'
    end

    # Bind Ctrl+P to the fzf_find_file function
    bind \cp 'fzf_find_file'
  end

  # Show a fuzzy list of git commits with a preview of the commit diff
  abbr git-log 'git log --color --date=format:"%Y-%m-%d" --format="%h - %cd - %s" | fzf --ansi --preview "git show --color {1}"'
end
