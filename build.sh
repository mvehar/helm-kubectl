#!/bin/bash

IMAGE=mvehar/helm-kubectl

docker build -t $IMAGE .
docker push $IMAGE
