CSS_FRAMEWORK_NAME ?= "SET A NAME 🚀"
INSTALL_DEPENDENCIES ?= server_start composer_install
START_DEPENDENCIES ?= server_start
STOP_DEPENDENCIES ?= server_stop

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
			split($$1, line, ":"); \
			if (line[1] == "Makefile") { \
				# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
				# You need to use targets=line[2] instead of targets=line[1]. \
				targets=line[2]; \
			} else { \
				targets=line[1]; \
			} \
			description=$$2; \
			if (targets == "##") { \
				# --- space --- \
				printf "\033[33m%s\n", ""; \
			} else if (targets == "" && description != "") { \
				# --- title --- \
				printf "\033[33m\n%s\n", description; \
			} else if (targets != "" && description != "") { \
				# --- target, alias, description --- \
				split(targets, parts, " "); \
				target=parts[1]; \
				alias=parts[2]; \
				printf "\033[32m  %-26s \033[34m%-2s \033[0m%s\n", target, alias, description; \
			} \
		}'
	@echo

## — PROJECT 🚀 ———————————————————————————————————————————————————————————————

.PHONY: install
install: $(INSTALL_DEPENDENCIES) ## Start and install a local project (the very first time)

.PHONY: start
start: $(START_DEPENDENCIES) ## Start the project

.PHONY: stop
stop: $(STOP_DEPENDENCIES) ## Stop the project

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

##

.PHONY: npm_watch
npm_watch: ## Compile assets and automatically re-compile when files change
	npm run watch

.PHONY: npm_server
npm_server: ## Run a dev-server that can sometimes update your code without refreshing the page
	npm run dev-server

.PHONY: npm_dev
npm_dev: ## Compile assets once
	npm run dev

.PHONY: npm_build
npm_build: ## On deploy, create a production build
	npm run build

## — ASSETS 🎨‍ ————————————————————————————————————————————————————————————————

.PHONY: assets
assets: ## Output all mapped assets
	symfony console debug:asset-map
