#!/bin/bash

docker build -t hello_image:1.0 \.
docker run -d -p 80:80 -p 81:81 --name hello_container hello_image:1.0
echo "-----| BUILD COMPLETE |-----"