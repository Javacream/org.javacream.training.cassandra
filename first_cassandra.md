## Keyspace anlegen

create keyspace training with replication={'class': 'SimpleStrategy', 'replication_factor': 1};

## Anlegen eines Datencontainers

create table first (message text, primary key(message));
