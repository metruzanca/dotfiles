if type -q zellij
  # Start zellij automatically (except in vscode)
  # if not set -q ZELLIJ; and test "$TERM_PROGRAM" != "vscode"
  #   # Attach to "main" session or create it if it doesn't exist
  #   zellij attach --create main
  #   # kill fish when exiting zellij
  #   kill $fish_pid
  # end
end
