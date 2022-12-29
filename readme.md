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
