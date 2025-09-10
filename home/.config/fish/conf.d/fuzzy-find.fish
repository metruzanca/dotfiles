if type -q fzf and type -q bat
  function fzf_find_file
    command find . -type f -print | fzf --preview 'bat --color=always {}'
  end

  bind \cp 'fzf_find_file'
end

