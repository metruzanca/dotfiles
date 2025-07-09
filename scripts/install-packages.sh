#!/usr/bin/env bash

if command -v yay >/dev/null 2>&1; then
    yay -S \
        fish \
        lsd \
        starship \
        zoxide \
        evil-helix-bin \
        zellij \
        pfetch \
        jq \
        tree \
        rust \
        dust \
        github-cli \
        discord \
        gitui \
        volta-bin \
        parsec-bin \
        ripgrep \
        stow \
        htop \
        # GUI software
        alacritty \
        proton-mail \
        visual-studio-code \
        ## Browsers
        zen-browser-bin \
        falkon \
        brave-bin;
        # yazi
        # dua
    exit 0
fi


if command -v brew >/dev/null 2>&1; then
    # Shell Essentials
    brew install \
        fish \
        starship \
        lsd \
        pfetch \
        stow \
        zoxide;

    # Terminal Apps
    brew install \
        htop \
        gh \
        evil-helix \
        tree \
        volta \
        awscli;

    # Experimenting with these Apps
    # https://jj-vcs.github.io/jj
    brew install jj;

    if [[ "$(uname)" == "Darwin" ]]; then
        # Fonts
        brew install --cask \
            font-comic-mono \
            font-fira-code-nerd-font \
            font-liga-comic-mono;

        # Install Cask Apps
        brew install --cask \
            brave \
            alacritty \
            visual-studio-code \
            alt-tab \
            caffeine \
            raycast \
            rectangle \
            slack \
            docker \
            shottr \
            appcleaner \
            keycastr \
            kap \
            spotify \
            notion \
            linear-linear \
            beekeeper-studio \
            tunnelblick \
            discord \
            whatsapp;
    fi

    exit 0
fi
echo "No package manager found. Please install either 'yay' or 'brew'."