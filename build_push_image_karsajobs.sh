#!/bin/bash

# Build Docker image untuk backend karsajobs
docker build -t charlesprof/karsajobs:latest .

# Login ke Docker Hub menggunakan environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u charlesprof --password-stdin

# Push image ke Docker Hub
docker push charlesprof/karsajobs:latest

