//insert into user (lastname, firstname) values ('Sawitzki', 'Werner');
//select * from user where lastname = 'Sawitzki';
//alter table user add middle_initial text;
//insert into user (lastname, firstname, middle_initial) values ('Sawitzki', 'Werner', 'R.');
//insert into user (lastname, firstname, description) values ('Sawitzki', 'Werner', 'a brother');
//delete from user where lastname='Sawitzki'; //löscht de gesamte Partition
//delete from user where lastname='Sawitzki' and firstname='Werner';
//delete description from user where lastname='Sawitzki' and firstname='Werner';
//select description, writetime(description) from user where lastname = 'Sawitzki';
//update user USING TTL 300 set middle_initial = 'C.' where lastname = 'Sawitzki' and firstname = 'Rainer';
//select middle_initial, ttl(middle_initial) from user where lastname = 'Sawitzki';
//insert into user (lastname, firstname) values ('Sawitzki', 'Hugo') using TTL 60;