# Dotfiles

## Usage
1. Clone
2. Run `link.sh`: which will symlink all files in `home/` to the `$HOME` directory.

If adding a new file or pulling changes, re-run `link.sh`.

## OSs

I use all main OSs (linux, macOS, windows), so this dotfiles setup is designed to be universal. Running identically on Linux & Mac however only partially in WSL as certain apps (e.g. alacritty and espanso) need to be install on the Windows Host.

---

Unfortunately I don't know who originally wrote the linking script, if I find them I'll credit them here.

---

## Installers
Whenever I need a new system configured, I'll use one of these bash scripts to get up and running.

For now both my linux machine and my windows machine use debian so I've only got a `debian.sh` entry script. Once I've got a mac once more, I'll probably add a `macOs.sh` with nuances.

The `unix.sh` is the platform agnostic script that does the bulk of the heavy lifting and heavily relies on brew. Without brew, I'd need to make a separate script for mac, linux and the various distros. e.g. `brew install..`, `sudo apt install..`, `pacman -Sy..` all become `brew install..`. Brew also handles most of the path variables e.g. cargo which normally gets initted via `. "$HOME/.cargo/env"` or adding `$HOME/.cargo/bin` to path, is automatically handled by brew and doesn't need to be added to a bash/zsh/fish config file.

## Apps
- [HomeBrew](): Linux/MacOS agonstic package manager. The back bone of this config.
- [Fish Shell](https://fishshell.com/)
  - [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish): Themes
  - [Bass](https://github.com/edc/bass): Bash compatibility tool
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads):  (I specifically use FiraCode)
- [macchina](https://github.com/Macchina-CLI/macchina/): rust minimalist `neofetch` replacement. #rust
- [lsd](https://github.com/Peltoche/lsd): #rust `ls` replacement with nerdfont support.
- [Volta](https://volta.sh/): Like nvm but leagues better. #rust
- [Helix](https://helix-editor.com/): (I also use vscode, but the config isn't here yet) #rust
- [Alacritty](https://alacritty.org/): #rust

## Themes
- [Dracula](https://draculatheme.com/): recently been one of my gotos for everything.


## Fonts
- [FiraCode NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/latest)


---

## MacOS shenanagins
Disable two finger swipe for navigation. I need that for horrizontal scroll

`defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE`

# BrewFile docs
https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
