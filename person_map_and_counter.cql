//alter table person add phone_numbers map<text, text>
//update person set phone_numbers= {}  where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935;
//update person set phone_numbers= {'work': '2-234-56'}  where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935;
//update person set phone_numbers= phone_numbers + {'home': '1-234-56'}  where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935;
//select *from person;
//select phone_numbers['home'] from person where lastname = 'Sawitzki' and id = 57af9b5a-5b24-4fed-aab0-c19c51eb8935;
