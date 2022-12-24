source ~/.config/fish/1_vars.fish
source ~/.config/fish/2_aliases.fish
source ~/.config/fish/3_init.fish

function fish_greeting
  macchina
end


if type -q lsd
  # See https://github.com/rstacruz/fish-autols/ but changed to use lsd instead
  function __autols_hook --description "Auto ls" --on-event fish_prompt
    # if test "$NO_AUTO_LS" != ""
    #   return
    # end

    if test "$__autols_last" != (pwd)
      lsd
    end
    set  -g __autols_last (pwd)
  end
end


