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
