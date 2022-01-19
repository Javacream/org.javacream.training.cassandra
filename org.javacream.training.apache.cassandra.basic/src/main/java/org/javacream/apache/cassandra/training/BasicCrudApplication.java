package org.javacream.apache.cassandra.training;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Session;

public class BasicCrudApplication {

	public static void main(String[] args) {
		new BasicCrudApplication().execute();
	}

	private Cluster cluster;
	private Session session;

	private void execute() {
		try {
			cluster = Cluster.builder().addContactPoint("localhost").build();
			session = cluster.connect();
			createAndUseKeyspace();
			createTables();
			insertUsers();
			insertStatus();
		} finally {
			if (cluster != null)
				cluster.close();
		}
  
	}
	
	private void createAndUseKeyspace(){
		session.execute("DROP KEYSPACE IF EXISTS javacream_training;");
		session.execute("CREATE KEYSPACE javacream_training WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};");
		session.execute("USE javacream_training;");
		
	}
	
	private void createTables(){
		session.execute("CREATE TABLE users (username text PRIMARY KEY, email text, encrypted_password blob);");
		session.execute("CREATE TABLE users_status (username text, id timeuuid, status text, primary key(username, id));");
		
	}
	private void insertStatus(){
		session.execute("INSERT INTO users_status (username, id, status) VALUES('emil', NOW(), 'waiting') ;");
		session.execute("INSERT INTO users_status (username, id, status) VALUES('hugo', NOW(), 'drinking') ;");
		session.execute("INSERT INTO users_status (username, id, status) VALUES('hugo', NOW(), 'eating') ;");
		session.execute("INSERT INTO users_status (username, id, status) VALUES('emil', NOW(), 'walking') ;");
		session.execute("INSERT INTO users_status (username, id, status) VALUES('hugo', NOW(), 'talking') ;");

		
		
	}
	private void insertUsers(){
		session.execute("INSERT INTO users (username, email, encrypted_password) VALUES('emil', 'emil@javacream.org', 0x1234) ;");
		session.execute("INSERT INTO users (username, email, encrypted_password) VALUES('hugo', 'hugo@javacream.org', 0x1235) ;");
		session.execute("INSERT INTO users (username, email, encrypted_password) VALUES('hans', 'hans@javacream.org', 0x1236) ;");
		session.execute("INSERT INTO users (username, email, encrypted_password) VALUES('erik', 'erik@javacream.org', 0x1237) ;");
		
	}

}
