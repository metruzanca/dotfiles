# Dotfiles

My configuration files, powered by gnu stow.

## Setup

Clone this repo in your home directory.

> [!note]
> Install `stow` command
>
> ```bash
> brew install stow
> sudo pacman -S stow
> sudo apt install stow
> ```

```bash
git submodule update --init --recursive;
stow home
# On macos only
stow macos
```

## File Structure

```bash
.
├── home      # Home directory for all
├── macos     # MacOS specific directories
├── windows   # Windows specific directories (need to manually symlink)
└── scripts   # Helpful scripts
```

---

## Future Improvements

- Look into https://www.chezmoi.io
