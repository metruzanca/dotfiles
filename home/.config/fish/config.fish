# ---------- Utilities ----------
set -l os (uname)
set -l username (whoami)
# ---------- Fish Shell configuration ----------

# Required on macos as a first step
if test -f /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Required on if using Linuxbrew
if test -f /home/linuxbrew/.linuxbrew/bin/brew
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Use Rust-based coreutils instead of GNU coreutils
fish_add_path /opt/homebrew/opt/uutils-coreutils/libexec/uubin

set -gx EDITOR hx

if type -q zellij
    if set -q ZELLIJ
    else
        zellij attach main || zellij --session main || zellij
    end
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

if type -q lsd
    abbr ls lsd
end

if type -q zoxide
    abbr cd z
end

if type -q zellij
    abbr zj "zellij attach main || zellij --session main || zellij"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    if type -q pfetch
        if test "$TERM_PROGRAM" = "vscode"
            return
        end
        pfetch
    end
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

# TODO use rust uutils-coreutils instead of GNU coreutils
# fish_add_path "/opt/homebrew/opt/uutils-coreutils/libexec/uubin"

# ---------- Auto appended scripts ----------
