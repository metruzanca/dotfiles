.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Sets up submodules
	@git submodule update --init --recursive;

.PHONY: stow
stow: ## Stows the default config files used on all machines
	@stow home;

#.PHONY: macos
#macos: ## Sets up macos specific dependencies
#	# TODO