drop keyspace if exists training_sawitzki ;
create KEYSPACE training_sawitzki WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
use training_sawitzki;
create table user (lastname text, firstname text, description text, primary key (lastname, firstname));
insert into user (lastname, firstname, description) values ('Sawitzki', 'Rainer', 'a trainer');
insert into user (lastname, firstname, description) values ('Sawitzki', 'Klaus', 'a brother');
insert into user (lastname, firstname, description) values ('Mustermann', 'Hanna', 'a participant');
insert into user (lastname, firstname, description) values ('Metzger', 'Georg', 'another participant');
