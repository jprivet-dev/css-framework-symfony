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

.PHONY: install
install: $(INSTALL_DEPENDENCIES) ## Start and install a local project (the very first time)

.PHONY: start
start: server_start ## Start the project

.PHONY: stop
stop: server_stop ## Stop the project

## — SYMFONY 🎵 ———————————————————————————————————————————————————————————————

.PHONY: cc
cc: ## Clear the cache
	symfony console cache:clear

.PHONY: server_start
server_start: ## Run a local web server
	symfony server:start -d

.PHONY: server_stop
server_stop: ## Stop the local web server
	symfony server:stop

.PHONY: servers_stop_all
servers_stop_all: ## Stop all local web servers
	symfony server:stop --all

## — COMPOSER 🧙 ——————————————————————————————————————————————————————————————

.PHONY: composer
composer: ## Run composer. Pass the parameter with "p=" (example: make composer p="require --dev phpunit/phpunit")
	@$(eval p ?=)
	composer $(p)

.PHONY: composer_version
composer_version: ## Composer version
	composer --version

.PHONY: composer_install
composer_install: ## Install packages using composer
	composer install

.PHONY: composer_install@prod
composer_install@prod: ## Install packages using composer (PROD)
	composer install --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

## — NPM 📦 ———————————————————————————————————————————————————————————————————

.PHONY: npm
npm: ## Run npm. Pass the parameter with "p=" (example: make npm p="install my-lib")
	@$(eval p ?=)
	npm $(p)

.PHONY: npm_version
npm_version: ## npm version
	npm --version

.PHONY: npm_install
npm_install: ## Install dependencies using npm
	npm install

## — ASSETS 🎨‍ ————————————————————————————————————————————————————————————————

.PHONY: assets
assets: ## Output all mapped assets
	symfony console debug:asset-map
