.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
stow: ## Apply dotfiles
	@stow --restow --no-folding home
	@echo "Applied dotfiles"

.PHONY: clean
clean: ## Remove applied dotfiles
	@stow -D --no-folding home
	@echo "Removed applied dotfiles"


.PHONY: macos-apply
macos-apply: ## Apply all yaml files in the macos-prefs directory
	@uname | grep -qi 'darwin' || { echo "Not macOS. Skipping macos-prefs apply."; exit 0; }
	@command -v macos-defaults >/dev/null 2>&1 || { echo "macos-defaults not installed. please install: brew install dsully/tap/macos-defaults"; exit 0; }
	@for file in macos-defaults/*.yaml; do \
		macos-defaults apply $$file; \
	done
