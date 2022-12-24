# Dotfiles

After cloning, run `link.sh` to symlink all the files in `home/` to the `$HOME` directory. (Existing files will be moved to `$HOME/backup`)

If adding files to the repository or pulling changes, run `link.sh` to refresh all the links to the files.

## OSs

Currently supported OS is linux (ubuntu)

Once I'm on a mac again, I'll be editing my scripts to have cases for mac / linux, so that I may have 1 dotfiles that works for everything.

---

Unfortunately I don't know who originally wrote this linking script, if I find them I'll credit them here.

---

## Apps
- [Fish Shell](https://fishshell.com/)
  - [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish): Themes
  - [Bass](https://github.com/edc/bass): Bash compatibility tool

### CLIs
- [macchina](https://github.com/Macchina-CLI/macchina/): rust minimalist `neofetch` replacement
- [lsd](https://github.com/Peltoche/lsd): rust `ls` replacement with nerdfont support

### Fonts
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads):  (I specifically use FiraCode)


## Installation

```bash
curl https://get.volta.sh | bash
```

### Rust apps
```bash
cargo install macchina lsd
```

### Fish
```bash
sudo apt install fish; # ubuntu
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish;
omf install bass;
```

### Ubuntu Apps
```bash
# Configure git identity
git config --global user.name "Sam Zanca";
git config --global user.email "sam@zanca.dev";
```


## TODO
- [ ] Add github-cli
- [ ] Clean up the "Installation" section, ideally refactoring it to an idempotent & distro agnostic script.
  - [ ] Either find a tool for the distro-agnostic part or try using [Nix](https://github.com/NixOS/nix) or [Comtrya](https://www.comtrya.dev/)

