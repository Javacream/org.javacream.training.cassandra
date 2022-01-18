create type address (street text, city text, postal_code int);
alter table person add address frozen<address>;
update person set address= {street: 'Marienplatz', city: 'München', postal_code: 81371}  where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935;
