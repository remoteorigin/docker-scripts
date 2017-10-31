#!/bin/bash  
# Read Docker containers IDs from ~/containers.txt file and start them

while read containerID; do
  docker start $containerID
done < ~/containers.txt
docker ps
