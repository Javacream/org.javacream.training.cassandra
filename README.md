# Cassandra Training Project

## Setup using docker

see <https://hub.docker.com/_/cassandra/>

Start the cassandra server using 

docker run --name cassandra_server -d cassandra

Connect with cqlsh using

docker run -it --link cassandra_server:cassandra --rm cassandra cqlsh cassandra

