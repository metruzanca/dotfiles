# Dotfiles
New 2025 dotfiles branch


## MacOS system settings changes
- Scroll direction: turned “Natural scrolling” off
- Lowered mouse speed by “one notch”
- Function keys changed to be F# by default
- Changed doc position to the right, made dock auto-hide, and made it smaller

```bash
## Change default shell in macos
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s "$(which fish)"
## Requires full "logout" of user on macOS for changes to take effect
```