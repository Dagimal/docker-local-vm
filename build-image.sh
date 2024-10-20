#!/bin/bash

# Check if the user provided an image name and a directory
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image-name> <context-directory>"
    exit 1
fi

IMAGE_NAME=$1
CONTEXT_DIR=$2

# Build the Docker image
docker build -t "$IMAGE_NAME" "dockerfile/$CONTEXT_DIR"

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' built successfully from '$CONTEXT_DIR'."
else
    echo "Failed to build Docker image '$IMAGE_NAME'."
    exit 1
fi

