# Cassandra Training Project

## Setup using docker

see <https://hub.docker.com/_/cassandra/>

Start the cassandra server using 

docker run --name cassandra -p 9042:9042 cassandra:3

Connect with running container

docker exec -it cassandra /bin/bash

start shell using cqlsh
