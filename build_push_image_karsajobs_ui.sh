#!/bin/bash

# Script untuk build dan push Docker image frontend karsajobs-ui ke Docker Hub

# Build Docker image dari Dockerfile yang ada di direktori ini
# Tag image dengan format <username-docker>/karsajobs-ui:latest
docker build -t charlesprof/karsajobs-ui:latest .

# Login ke Docker Hub menggunakan password dari environment variable
# PASSWORD_DOCKER_HUB harus di-set sebelum menjalankan script ini
# Contoh: export PASSWORD_DOCKER_HUB=<password_kamu>
echo $PASSWORD_DOCKER_HUB | docker login -u charlesprof --password-stdin

# Push image yang sudah di-build ke Docker Hub
# Image akan tersedia di: https://hub.docker.com/r/charlesprof/karsajobs-ui
docker push charlesprof/karsajobs-ui:latest
