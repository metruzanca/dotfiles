# ---------- Initializations ----------
set -gx EDITOR hx

if set -q ZELLIJ
else
    zellij
end

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end

# Rust
#fish_add_path $HOME/.cargo/bin

# ---------- Fish Shell configuration ----------

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  pfetch
end

if type -q lsd
    abbr ls lsd
end

# Auto run ls when cd-ing around
if type -q lsd
    # See https://github.com/rstacruz/fish-autols/ but changed to use lsd instead
    function __autols_hook --description "Auto ls" --on-event fish_prompt
        # if test "$NO_AUTO_LS" != ""
        #   return
        # end

        if test "$__autols_last" != (pwd)
            lsd
        end
        set -g __autols_last (pwd)
    end
end
