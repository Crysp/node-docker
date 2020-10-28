# Variables

IMAGE_NAME = application_image
CONTAINER_NAME = application
PORT = 3333

# Tasks

build: ## Build
	$(call build_image)
	$(call create_container)

run: ## Run
	$(call start_container)

stop: ## Stop
	$(call stop_container)

start: ## Build and run
	make build
	make run

restart: ## Restart
	make stop
	make run

# Functions

define build_image
	docker build -t $(IMAGE_NAME) .
endef

define create_container
	docker create -p $(PORT):3000 \
		--mount type=bind,source=$(PWD),destination=/home/node/app \
		--mount type=volume,destination=/home/node/app/node_modules \
		--name $(CONTAINER_NAME) $(IMAGE_NAME)
endef

define start_container
	docker start $(CONTAINER_NAME)
endef

define stop_container
	docker stop $(CONTAINER_NAME)
endef
