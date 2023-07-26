# Dotfiles

Dotfiles repo powered GNU Stow. Stow takes care of symlinking file structures in this repo to local machine's $HOME.

This repo supports both MacOS and Linux machines.

Unfortunately, not POSIX compliant. Maybe will be in the future. Both Fish and ZSH are not POSIX :( and I've got configs for both tools in here. Most recently leaning into ZSH, though I still have a machine running my old fish config thats in here.

## Usage
1. Clone
2. Run `link.sh`: which will symlink all files in `home/` to the `$HOME` directory.

If adding a new file or pulling changes, re-run `link.sh`.

## Structure
- `link.zsh`: is the core of the dotfiles setup. Running this will:
    - Run stow on `home` & `private`.
    - Installs zsh plugins via `zplug`
    - Restarts [espanso](https://espanso.org) to reload the config.
    - TODO sync macos settings.
- `home`: is where the actual dotfiles live.
- `private`: is just like home but is a private repo thats submodule'd into this repo. Inside `private` I mainly have `.config/zsh/<files>` so those will be loaded when I source the whole directory in my `$HOME/.zshrc`.
- `os`: holds some workstation setup scripts as well as some other MacOS WIP stuff.

> Aside from the `private` submodule, this repo also submodules the [catppuccin theme](https://github.com/catppuccin/alacritty) inside the alacritty config folder.

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

# BrewFile docs
https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f


---

## TODO
- Checkout [Yabai](https://github.com/koekeishiya/yabai) for MacOS
- [Zellij](https://github.com/zellij-org/zellij) instead of tmux
- [Zed](https://zed.dev/) Editor
