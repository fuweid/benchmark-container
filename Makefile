NAME := Wei Fu
EMAIL := fuweid89@gmail.com
MAKEFLAGS += --silent

all: help

.PHONY: setup_dockerce
setup_dockerce: ## install docker-ce
	scripts/setup_docker-ce.sh

.PHONY: setup_pouchcontainer
setup_pouchcontainer: ## install pouchcontainer
	scripts/setup_pouchcontainer.sh

.PHONY: cleanup
cleanup: ## stop docker/pouch and remove package
	scripts/remove_docker-ce.sh
	scripts/remove_pouchcontainer.sh

.PHONY: rundockercli
rundockercli: cleanup setup_dockerce ## run benchmark for docker
	sudo bucketbench run -b fixtures/dockercli-run.yaml

.PHONY: runpouchcli
runpouchcli: cleanup setup_pouchcontainer ## run benchmark for pouchcontainer
	sudo bucketbench run -b fixtures/pouchcli-run.yaml

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort
