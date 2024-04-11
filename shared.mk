## — 🎵 🐳 CSS FRAMEWORK MAKEFILE 🐳 🎵 ———————————————————————————————————————

# Print self-documented Makefile:
# $ make
# $ make help

.DEFAULT_GOAL = help
.PHONY: help
help: ## Print self-documented Makefile
	@echo; \
	echo "\033[33m#\033[0m"; \
	echo "\033[33m#\033[0m $(CSS_FRAMEWORK_NAME)"; \
	echo "\033[33m#\033[0m"; \
    grep -E '(^[.a-zA-Z_-]+[^:]+:.*##.*?$$)|(^#{2})' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = "## "}; \
		{ \
			split($$1, command, ":"); \
			target=command[2]; \
			description=$$2; \
			# --- space --- \
			if (target=="##") \
				printf "\033[33m%s\n", ""; \
			# --- title --- \
			else if (target=="" && description!="") \
				printf "\033[33m\n%s\n", description; \
			# --- command + description --- \
			else if (target!="" && description!="") \
				printf "\033[32m  %-30s \033[0m%s\n", target, description; \
			# --- do nothing --- \
			else \
				; \
		}'
	@echo

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: start
start: ## Run a local web server
	symfony serve -d

.PHONY: stop
stop: ## Stop the local web server
	symfony server:stop

## — SYMFONY 🎵 ———————————————————————————————————————————————————————————————

.PHONY: cc
cc: ## Clear the cache
	symfony console cache:clear

.PHONY: stop_all
stop_all: ## Stop all local web servers
	symfony server:stop --all

## — ASSETS 🎨‍ ————————————————————————————————————————————————————————————————

.PHONY: assets
assets: ## Output all mapped assets
	symfony console debug:asset-map