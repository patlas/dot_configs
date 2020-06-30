#!/bin/bash -ex

cd "$(dirname "$0")"

IMAGE_NAME="debian_vim"
docker build -f Dockerfile -t ${IMAGE_NAME} .
