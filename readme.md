# Dotfiles

## Usage
1. Clone
2. Run `link.sh`: which will symlink all files in `home/` to the `$HOME` directory.

If adding a new file or pulling changes, re-run `link.sh`.

## OSs

I use all main OSs (linux, macOS, windows), so this dotfiles setup is designed to be universal. Running identically on Linux & Mac however only partially in WSL as certain apps (e.g. alacritty and espanso) need to be install on the Windows Host.

## Installers
The `os` folder holds scripts to quickly get new machines configured.

## Apps
- [HomeBrew](https://brew.sh): Linux/MacOS agonstic package manager.
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads):  (I specifically use FiraCode)
- [macchina](https://github.com/Macchina-CLI/macchina/): rust minimalist `neofetch` replacement. #rust
- [lsd](https://github.com/Peltoche/lsd): #rust `ls` replacement with nerdfont support.
- [Volta](https://volta.sh/): Like nvm but leagues better. #rust
- [Helix](https://helix-editor.com/): (I also use vscode, but the config isn't here yet) #rust
- [Alacritty](https://alacritty.org/): #rust

## Themes
- [Dracula](https://draculatheme.com/)
- [Catpuccin](https://github.com/catppuccin/catppuccin)


## Fonts
- [FiraCode NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/latest)


---

## MacOS shenanagins
Disable two finger swipe for navigation. I need that for horrizontal scroll

`defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE`

# BrewFile docs
https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
