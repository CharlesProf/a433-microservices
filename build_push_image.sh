#!/usr/bin/env bash

# Stop the script immediately if any command fails.
set -euo pipefail

# Define the local image name and tag used for the first build.
LOCAL_IMAGE_NAME="item-app"
IMAGE_TAG="v1"

# Define the Docker Hub username through an environment variable.
: "${DOCKERHUB_USERNAME:?Please export DOCKERHUB_USERNAME before running this script.}"

# Define the Docker Hub password through an environment variable.
: "${PASSWORD_DOCKER_HUB:?Please export PASSWORD_DOCKER_HUB before running this script.}"

# Build the Docker image from the Dockerfile with the required local name and tag.
docker build -t "${LOCAL_IMAGE_NAME}:${IMAGE_TAG}" .

# Show the list of local Docker images after the build process.
docker images

# Rename the image to match the Docker Hub repository format.
docker tag "${LOCAL_IMAGE_NAME}:${IMAGE_TAG}" "${DOCKERHUB_USERNAME}/${LOCAL_IMAGE_NAME}:${IMAGE_TAG}"

# Log in to Docker Hub from the terminal using password-stdin.
echo "${PASSWORD_DOCKER_HUB}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

# Push the tagged image to Docker Hub.
docker push "${DOCKERHUB_USERNAME}/${LOCAL_IMAGE_NAME}:${IMAGE_TAG}"
