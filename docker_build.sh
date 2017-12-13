#!/bin/bash
docker build -t docker-snapshot.otlabs.fr/tools/chaos-monkey:1.0 .


read -p "Push docker image? " -n 1 -r
if [[ $REPLY =~ ^[YytT]$ ]]
then
  docker push docker-snapshot.otlabs.fr/tools/chaos-monkey:1.0
fi
echo ''
