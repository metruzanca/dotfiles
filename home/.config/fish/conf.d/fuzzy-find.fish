if type -q fzf and type -q bat and type -q fd
  function fzf_find_file
    command fd -t f --hidden --exclude .git . | fzf --preview 'bat --color=always {}'
  end

  bind \cp 'fzf_find_file'
end
