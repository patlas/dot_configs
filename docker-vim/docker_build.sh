#!/bin/bash -ex

cd "$(dirname "$0")"

IMAGE_NAME="debian-vim"
docker build -f Dockerfile -t ${IMAGE_NAME} .
