# ---------- Script Utilities ----------
set -l os (uname)
set -l username (whoami)
# ---------- Fish Shell configuration ----------

# Setup homebrew first as most packages depend on this
if test -f /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
    fish_add_path /opt/homebrew/opt/uutils-coreutils/libexec/uubin
end

if test -f /home/linuxbrew/.linuxbrew/bin/brew
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fish_add_path /home/linuxbrew/.linuxbrew/opt/uutils-coreutils/libexec/uubin
end

set -gx EDITOR hx

# Shell integrations
if type -q starship; starship init fish | source; end
if type -q direnv; direnv hook fish | source; end
if type -q zoxide;
    zoxide init fish | source;
    abbr cd z;
end

if type -q lsd
    abbr ls lsd;
    # Auto run ls when cd-ing around
    # See https://github.com/rstacruz/fish-autols/ but changed to use lsd instead
    function __autols_hook --description "Auto ls" --on-event fish_prompt
        if test "$__autols_last" != (pwd)
            lsd
        end
        set -g __autols_last (pwd)
    end
end

function fish_greeting
    if type -q pfetch
        if test "$TERM_PROGRAM" = "vscode"
            return
        end
        pfetch
    end
end
