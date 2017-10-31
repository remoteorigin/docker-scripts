#!/bin/bash  
# Stop all runnining Docker containers and save them into ~/containers.txt file

rm -f ~/containers.txt
docker ps -a -q > ~/containers.txt
docker stop $(docker ps -a -q)
docker ps
