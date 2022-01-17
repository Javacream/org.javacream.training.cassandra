## Anlegen eines neuen Keyspaces

- create keyspace test_sawitzki with replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
- use test_sawitzki;
- use test_sawitzki;

## Anlegen einer Tabelle

- create table messages (message text, primary key (message));
