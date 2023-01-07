#!/bin/sh
# ---- Install distro-agnostic package manager ----
# With brew, this script can be universally re-used between macos and linux

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
# Init Brew in current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

# ---- Install and Setup the Fish Shell ----

brew install fish
## brew install on linux doesn't seem to add fish to shells
which fish | sudo tee -a /etc/shells; 
## Change the default shell to fish
chsh -s "$(which fish)";
## Install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish;
## Install bass for bash scripts compatibility
omf install bass;

# ---- Install & setup zsh ----

brew install zsh

# ---- Install Packages ----

# Use Brew to install packages
brew install rust macchina lsd volta helix starship;

# Use Volta to setup javascript ecosystem
volta install node typescript typescript-language-server pnpm;
