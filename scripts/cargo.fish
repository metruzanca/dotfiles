#!/usr/bin/env fish

# The purpose of this script is to both save a list of all cargo extensions I use
# and to automate the installation of these extensions.

# ---------- Script Code ----------

if not type -q cargo; or not type -q gum
  echo "Cargo and/or gum is not installed."
  exit 1
end


function confirm_install
  set -l tool $argv[1]

  # Check if the tool is already installed
  cargo $tool --version &> /dev/null

  # Status is set to 0 if the command was successful
  if not test $status -eq 0
    set -l cargo_pkg "cargo-$tool"
    # Use gum to confirm installation
    if gum confirm "Install $cargo_pkg?"; 
      cargo install $cargo_pkg
    end
  end
end

# ---------- Cargo extensions ----------

confirm_install watch
