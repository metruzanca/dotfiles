.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Sets up submodules
	@git submodule update --init --recursive;

.PHONY: stow
stow: ## Stows the default config files used on all machines
	@stow home;

.PHONY: install
install: ## Installs all my packages using yay
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
	
	

#.PHONY: macos
#macos: ## Sets up macos specific dependencies
#	# TODO
