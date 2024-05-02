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
			# If you import a file in this Makefile (e.g.: include .env), line[1] is given the name of the current Makefile. \
			# You need to use targets=line[2] instead of targets=line[1]. \
			targets=line[2]; \
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

.PHONY: cache_clear cc
cache_clear cc: ## Clear the cache
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
composer: ## Run composer. Arguments: p (composer params). Example: $ make composer p="require --dev phpunit/phpunit"
	@$(eval p ?=)
	$(COMPOSER) $(p)

.PHONY: composer_version
composer_version: ## Composer version
	$(COMPOSER) --version

.PHONY: composer_validate
composer_validate: ## Validate composer.json and composer.lock
	$(COMPOSER) validate --strict --lock

.PHONY: composer_clean
composer_clean: confirm_continue ## Remove vendor & composer.lock [y/N]
	rm composer.lock && rm -Rf vendor

##

.PHONY: composer_install
composer_install: vendor composer.lock ## Install packages using composer

.PHONY: composer_install@prod
composer_install@prod: ## Install packages using composer (PROD)
	$(COMPOSER) install --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

.PHONY: composer_update
composer_update: ## Update packages using composer
	$(COMPOSER) update

.PHONY: composer_update@prod
composer_update@prod: ## Update packages using composer (PROD)
	$(COMPOSER) update --verbose --prefer-dist --no-progress --no-interaction --no-dev --optimize-autoloader

##

composer.lock: composer.json ## Check if the composer.lock is up to date with the latest changes in composer.json (run 'composer update') [y/N]
	@echo "$(YELLOW)Warning: The composer.lock is not up to date with the latest changes in composer.json (run 'composer update').$(RESET)"
	@$(MAKE) -s confirm question="Run 'composer update'?" make_yes="composer_update"

vendor: composer.json ## Check if vendor is up to date with the latest changes in composer.json (run 'composer install')
	@echo "$(YELLOW)Warning: vendor is not up to date with the latest changes in composer.json (run 'composer install').$(RESET)"
	$(COMPOSER) install

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

## — INTERNAL 🚧‍️ ——————————————————————————————————————————————————————————————

.PHONY: confirm
confirm: ## Display a confirmation before executing a makefile command. Arguments: question [make_yes] [make_no] [no_interaction]. Example: @$(MAKE) -s confirm question="Are you sure?" make_yes="command_on_yes" make_no="command_on_no"
	@$(if $(question),, $(error question argument is required))   # Question to display
	@$(eval make_yes ?=)                                          # Makefile commands to execute on yes
	@$(eval make_no ?=)                                           # Makefile commands to execute on no
	@$(eval no_interaction ?=)                                    # Do not ask any interactive question
	@\
	question=$${question:-"Confirm?"}; \
	if [ "$${no_interaction}" != "true" ]; then \
		echo -n "$(GREEN)$${question}$(RESET) [$(YELLOW)y/N$(RESET)]: "; \
		read answer; \
	fi; \
	answer=$${answer:-N}; \
	if [ "$${answer}" = y ] || [ "$${answer}" = Y ] || [ "$${no_interaction}" = "true" ]; then \
		[ -z "$$make_yes" ] && echo "$(YELLOW)(YES) no action!$(RESET)" || $(MAKE) -s $$make_yes; \
	else \
		[ -z "$$make_no" ] && echo "$(YELLOW)(NO) no action!$(RESET)" || $(MAKE) -s $$make_no; \
	fi

PHONY: confirm_continue
confirm_continue: ## Display a confirmation before continuing [y/N]
	@echo -n "$(GREEN)Do you want to continue?$(RESET) [$(YELLOW)y/N$(RESET)]: " && read answer && [ $${answer:-N} = y ]
