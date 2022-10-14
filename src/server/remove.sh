#!/bin/bash

docker stop hello_container # stop container
docker rm hello_container # delete container
docker rmi hello_image:1.0 # delete image
docker images # shows images
echo "-----| DOCKER IMAGE HAS GONE |-----"
