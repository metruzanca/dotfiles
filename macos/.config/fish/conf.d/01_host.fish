# macOS PATH setup. Linked from the `macos/` stow package.
# Homebrew first, so its packages win over anything else on PATH.
for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew
  if test -f $brew_prefix/bin/brew
    eval ($brew_prefix/bin/brew shellenv)
    fish_add_path $brew_prefix/opt/uutils-coreutils/libexec/uubin
    fish_add_path $brew_prefix/opt/libpq/bin
    break
  end
end
