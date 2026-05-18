#!/bin/bash

# Build Docker image untuk frontend karsajobs-ui
docker build -t charlesprof/karsajobs-ui:latest .

# Login ke Docker Hub menggunakan environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u charlesprof --password-stdin

# Push image ke Docker Hub
docker push charlesprof/karsajobs-ui:latest
