## Keyspace anlegen

create keyspace training with replication={'class': 'SimpleStrategy', 'replication_factor': 1};

## Keyspace nutzen

use training;

## Anlegen eines Datencontainers

create table first (message text, primary key(message));

## Anlegen eines Datensatzes

insert into first (message) values('Hello');

select * from messages;
