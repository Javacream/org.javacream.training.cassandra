DROP KEYSPACE IF EXISTS LOGS;

CREATE KEYSPACE LOGS
  WITH REPLICATION = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
  };

USE LOGS;
  
CREATE TABLE SERVER_LOG(
	server text,
	timestamp uuid,
	severity text,
	body blob,
	primary key(server, timestamp)) WITH CLUSTERING ORDER BY ("timestamp" DESC);


CREATE TABLE SERVER_LOG_BY_SEVERITY(
	server text,
	timestamp uuid,
	severity text,
	body blob,
	primary key(severity, server, timestamp)) WITH CLUSTERING ORDER BY ("timestamp" DESC);

BEGIN BATCH
	INSERT INTO SERVER_LOG (server, timestamp, severity, body) VALUES('Oracle DB', NOW(), 'INFO', textAsBlob('Starting up'))
	INSERT INTO SERVER_LOG (server, timestamp, severity, body) VALUES('Oracle DB', NOW(), 'INFO', textAsBlob('Startup complete'))
	INSERT INTO SERVER_LOG (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'INFO', textAsBlob('Start...'))
	INSERT INTO SERVER_LOG (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'ERROR', textAsBlob('Exception starting up...'))
	INSERT INTO SERVER_LOG (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'CRITICAL', textAsBlob('starting aborted!'))
	INSERT INTO SERVER_LOG_BY_SEVERITY (server, timestamp, severity, body) VALUES('Oracle DB', NOW(), 'INFO', textAsBlob('Starting up'))
	INSERT INTO SERVER_LOG_BY_SEVERITY (server, timestamp, severity, body) VALUES('Oracle DB', NOW(), 'INFO', textAsBlob('Startup complete'))
	INSERT INTO SERVER_LOG_BY_SEVERITY (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'INFO', textAsBlob('Start...'))
	INSERT INTO SERVER_LOG_BY_SEVERITY (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'ERROR', textAsBlob('Exception starting up...'))
	INSERT INTO SERVER_LOG_BY_SEVERITY (server, timestamp, severity, body) VALUES('JBOSS', NOW(), 'CRITICAL', textAsBlob('starting aborted!'))
APPLY BATCH;