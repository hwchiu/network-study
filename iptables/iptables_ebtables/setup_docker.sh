#!/bin/bash
docker rm -f nginx
docker rm -f netutils

docker run -d -p 5566:80 --name nginx nginx
docker run -d --name netutils hwchiu/netutils
