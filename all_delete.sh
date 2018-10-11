#!/bin/sh

# delete all container images
docker rm $(docker ps -aq)
# delete all images.
docker images | awk 'NR>1 {print $3}' | xargs docker rmi -f
