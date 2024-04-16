# Customize these variables
IMAGE_NAME ?= nai-utils
TAG ?= 0.3
#DOCKER_REGISTRY ?= quay.io/wolfgangntnx
DOCKER_REGISTRY ?= quay.io/jesseagonzalez
CONTAINER_ENGINE ?= docker # or podman

# Build the Docker image
build:
	$(CONTAINER_ENGINE) build --platform linux/amd64 -t $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG) .

# Push the Docker image to a registry
push:
	$(CONTAINER_ENGINE) push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG)

# All-in-one command to build and push
all: build push

# test llama2-7b download to validate hf_token being set properly. ex. HF_TOKEN=<TOKEN> make download-llama2-7b
download-llama2-7b:
	docker run --rm -it -e HF_TOKEN=${HF_TOKEN} \
		$(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG) ntnx://llama2_7b/6fdf2e60f86ff2481f2241aaee459f85b5b0bbb9 /mnt/models

# test mpt-7b download to validate hf_token being unset will still work. ex. make download-mpt-7b
download-mpt-7b:
	docker run --rm -it $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG) ntnx://mpt_7b /mnt/models
