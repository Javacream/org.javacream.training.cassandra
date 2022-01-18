//alter table person add firstnames set<text>;
//alter table person add emails list<text>;
//update person set emails = [] where lastname = 'Sawitzki' and id = 4d137f21-9469-404f-b4ad-e25047b01ef3;
//update person set firstnames={}  where lastname = 'Sawitzki' and id = 4d137f21-9469-404f-b4ad-e25047b01ef3;
//update person set firstnames={'Rainer', 'Ulrich'}  where lastname = 'Sawitzki' and id = 4d137f21-9469-404f-b4ad-e25047b01ef3;
//update person set firstnames={'Ulrich'}  where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935 ;
//select * from person where lastname = 'Sawitzki' and firstnames contains 'Ulrich' ALLOW FILTERING;
//create index on person(firstnames);
select * from person where lastname = 'Sawitzki' and firstnames contains 'Ulrich';