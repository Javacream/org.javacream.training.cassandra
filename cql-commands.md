## Anlegen eines neuen Keyspaces

- create keyspace test_sawitzki with replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
- use test_sawitzki;
- use test_sawitzki;

## Anlegen einer Tabelle

- create table messages (message text, primary key (message));

## Datensätze

- insert into messages (message) values ('Hello');
- select * from messages;
- update messages set message = 'Goodbye' where massage = 'Hello';
  - geht nicht
- delete from messages where message = 'Hello';

