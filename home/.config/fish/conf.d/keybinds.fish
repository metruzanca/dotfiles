# Ctrl+R to reload the fish configuration
bind \cr 'exec fish'

# Bind Ctrl+P to the fzf_find_file function
if functions -q fzf_find_file
    bind \cp 'fzf_find_file'
end

# Bind Ctrl+O to open the current directory in $EDITOR
bind \co 'eval "$EDITOR ."'
