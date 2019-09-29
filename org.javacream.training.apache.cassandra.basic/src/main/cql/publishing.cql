DROP KEYSPACE IF EXISTS PUBLISHING;

CREATE KEYSPACE PUBLISHING
  WITH REPLICATION = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
  };

USE PUBLISHING;
  
CREATE TABLE PUBLISHERS(
	publisher_name text,
	title text,
	isbn text,
	price double,
	pages int,
	available boolean,
	primary key(publisher_name, title)
);
CREATE TABLE BOOKS(
	isbn text,
	partition text,
	title text,
	price double,
	pages int,
	available boolean,
	primary key(partition, title)
);

CREATE TABLE BOOKS_WITH_INDEX(
	isbn text,
	id uuid,
	title text,
	price double,
	pages int,
	available boolean,
	primary key(id, title)
);

CREATE INDEX ON BOOKS_WITH_INDEX(title);


CREATE TABLE BOOKS_BY_TITLE_AND_PRICE(
	partition text,
	isbn text,
	title text,
	price double,
	pages int,
	available boolean,
	primary key(partition, title, price)
);

CREATE TABLE BOOKS_KEYWORDS(
	keyword text,
	isbn text, 
	
	primary key (keyword, isbn)
);

CREATE TABLE KEYWORDS_BOOKS(
	keyword text,
	isbn text, 
	
	primary key (isbn, keyword)
);



INSERT INTO BOOKS (partition, isbn, title, pages, price, available) VALUES('Cassandra in Action', 'ISBN-1', 'Cassandra in Action', 200, 19.99, true);
INSERT INTO BOOKS (partition, isbn, title, pages, price, available) VALUES('Learning Cassandra', 'ISBN-2', 'Learning Cassandra', 300, 19.99, true);
INSERT INTO BOOKS (partition, isbn, title, pages, price, available) VALUES('MySQL', 'ISBN-3', 'MySQL', 100, 9.99, false);
INSERT INTO BOOKS (partition, isbn, title, pages, price, available) VALUES('Java', 'ISBN-4', 'Java', 500, 49.99, true);

INSERT INTO BOOKS_WITH_INDEX (id, isbn, title, pages, price, available) VALUES(uuid(), 'ISBN-1', 'Cassandra in Action', 200, 19.99, true);
INSERT INTO BOOKS_WITH_INDEX (id, isbn, title, pages, price, available) VALUES(uuid(), 'ISBN-2', 'Learning Cassandra', 300, 19.99, true);
INSERT INTO BOOKS_WITH_INDEX (id, isbn, title, pages, price, available) VALUES(uuid(), 'ISBN-3', 'MySQL', 100, 9.99, false);
INSERT INTO BOOKS_WITH_INDEX (id, isbn, title, pages, price, available) VALUES(uuid(), 'ISBN-4', 'Java', 500, 49.99, true);


INSERT INTO PUBLISHERS (publisher_name, isbn, title, pages, price, available) VALUES('Addison', 'ISBN-3', 'MySQL', 100, 9.99, false);
INSERT INTO PUBLISHERS (publisher_name, isbn, title, pages, price, available) VALUES('Addison', 'ISBN-1', 'Cassandra in Action', 200, 19.99, true);
INSERT INTO PUBLISHERS (publisher_name, isbn, title, pages, price, available) VALUES('Springer', 'ISBN-2', 'Learning Cassandra', 300, 19.99, true);
INSERT INTO PUBLISHERS (publisher_name, isbn, title, pages, price, available) VALUES('Springer', 'ISBN-4', 'Java', 500, 49.99, true);

INSERT INTO BOOKS_BY_TITLE_AND_PRICE (partition, isbn, title, pages, price, available) VALUES('books', 'ISBN-1', 'Cassandra in Action', 200, 19.99, true);
INSERT INTO BOOKS_BY_TITLE_AND_PRICE (partition, isbn, title, pages, price, available) VALUES('books', 'ISBN-2', 'Learning Cassandra', 300, 19.99, true);
INSERT INTO BOOKS_BY_TITLE_AND_PRICE (partition, isbn, title, pages, price, available) VALUES('books', 'ISBN-3', 'MySQL', 100, 9.99, false);
INSERT INTO BOOKS_BY_TITLE_AND_PRICE (partition, isbn, title, pages, price, available) VALUES('books', 'ISBN-4', 'Java', 500, 49.99, true);

BEGIN BATCH
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Programming', 'ISBN-4')
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Programming', 'ISBN-1')
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Programming', 'ISBN-2')
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Databases', 'ISBN-1')
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Databases', 'ISBN-2')
INSERT INTO BOOKS_KEYWORDS (keyword, isbn) values('Databases', 'ISBN-3')


INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Programming', 'ISBN-4')
INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Programming', 'ISBN-1')
INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Programming', 'ISBN-2')
INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Databases', 'ISBN-1')
INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Databases', 'ISBN-2')
INSERT INTO KEYWORDS_BOOKS (keyword, isbn) values('Databases', 'ISBN-3')

APPLY BATCH;