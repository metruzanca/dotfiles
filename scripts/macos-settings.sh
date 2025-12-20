#!/usr/bin/env bash

# Disable natural scrolling
defaults write -g com.apple.swipescrolldirection -bool false
# Revert to natural scrolling
# defaults write -g com.apple.swipescrolldirection -bool true

# Make F1–F12 standard function keys (Fn for media/brightness)
defaults write -g com.apple.keyboard.fnState -bool true
# Revert to media/brightness as default
# defaults write -g com.apple.keyboard.fnState -bool false

echo "MacOS settings applied, please restart or log out for changes to take effect."