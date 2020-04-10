#!/bin/bash
docker rm -f nginx
docker rm -f netutils
docker rm -f iperf

docker run -d -p 5566:80 --name nginx nginx
docker run -d --name netutils hwchiu/netutils
docker run -d --name iperf -p 12345:5201 --entrypoint iperf3 hwchiu/netutils -s -p 5201
