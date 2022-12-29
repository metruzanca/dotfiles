# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Setup Brew
echo '# Add HomeBrew to PATH' >> ~/.bashrc;
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc;

# Init Brew in current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

# Use Brew to install packages
brew install rust fish;

# Change the default shell to fish
chsh -s $(which fish);
# Install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish;
# Install bass for bash scripts compatibility
omf install bass;

# Use Rust to install rust apps
cargo install alacritty helix volta lsd macchina;

# Use Volta to setup javascript ecosystem
volta install node typescript typescript-language-server pnpm;
