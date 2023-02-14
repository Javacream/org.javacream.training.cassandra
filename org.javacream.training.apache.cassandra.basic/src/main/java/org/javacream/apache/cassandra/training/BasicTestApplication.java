package org.javacream.apache.cassandra.training;

import java.util.Date;
import java.util.List;

import com.datastax.driver.core.BatchStatement;
import com.datastax.driver.core.BatchStatement.Type;
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.utils.UUIDs;

public class BasicTestApplication {

	public static void main(String[] args) {
		new BasicTestApplication().execute();
	}

	private Cluster cluster;
	private Session session;
	private PreparedStatement preparedStatement;
	private PreparedStatement preparedStatementDelete;

	private void execute() {
		try {
			cluster = Cluster.builder().addContactPoint("h2908727.stratoserver.net").build();
			session = cluster.connect();
//			prepare();
			useKeyspace();
			long start =  System.currentTimeMillis();
//			insertAllRows();
//			System.out.println("insertAllRows: " + (System.currentTimeMillis() - start));
//			start =  System.currentTimeMillis();
//			selectAllRows();
//			System.out.println("selectAllRows: " + (System.currentTimeMillis() - start));
//			start =  System.currentTimeMillis();
//			deleteAllRows();
//			System.out.println("deleteAllRows: " + (System.currentTimeMillis() - start));
//			start =  System.currentTimeMillis();
//			selectAllRows();
//			System.out.println("selectAllRows: " + (System.currentTimeMillis() - start));
//			start =  System.currentTimeMillis();
			delete2000Rows();
			System.out.println("delete2000Rows: " + (System.currentTimeMillis() - start));
//			start =  System.currentTimeMillis();
//			selectAllRows();
//			System.out.println("selectAllRows: " + (System.currentTimeMillis() - start));
			
			
		} finally {
			if (cluster != null)
				cluster.close();
		}
  
	}
	
	private void useKeyspace(){
		session.execute("USE javacream_training;");
	    String insertQuery = new StringBuilder("") 
		  	      .append("INSERT INTO ")
		  	      .append("timers ")
		  	      .append("(partition_id, timer_id, routing_key, expiry_time) ")
		  	      .append("VALUES (")
		  	      .append("'emil'")
		  	      .append(", ")
		  	      .append(":timer_id")
		  	      .append(", ")
		  	      .append("'waiting'")
		  	      .append(", ")
		  	      .append(":expiry_time")
		  	      .append(");")
		  	      .toString();

      	 preparedStatement = session.prepare(insertQuery);
 	    String deleteQuery = new StringBuilder("") 
		  	      .append("DELETE from timers where partition_id='emil' and timer_id = :timer_id")
		  	      .toString();

    	 preparedStatementDelete = session.prepare(deleteQuery);
	}
	private void prepare(){
		session.execute("DROP KEYSPACE IF EXISTS javacream_training;");
		session.execute("CREATE KEYSPACE javacream_training WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};");
		session.execute("USE javacream_training;");
		session.execute("CREATE TABLE IF NOT EXISTS timers (\r\n"
				+ "				timer_id text,\r\n"
				+ "				partition_id text,\r\n"
				+ "				routing_key text,\r\n"
				+ "				expiry_time timeuuid,\r\n"
				+ "				PRIMARY KEY (partition_id, timer_id))\r\n"
				+ "		;");
		
		
	}
	private void insertAllRows() {
		BatchStatement batch = new BatchStatement(Type.UNLOGGED);
		for (int i = 0; i < 50000; i++) {
			String timerId = "id" + i;
			batch.add(bind(timerId));
		}
		session.execute(batch);
	}
	private void delete2000Rows() {
		BatchStatement batch = new BatchStatement(Type.UNLOGGED);
		for (int i = 50000; i < 99998; i++) {
			String timerId = "id" + i;
			batch.add(bindDelete(timerId));
		}
		session.execute(batch);
	}

	
	private void deleteAllRows() {
		session.execute("delete from timers where partition_id='emil';");
	}
	private void selectAllRows(){
		ResultSet resultSet = session.execute("select * from timers where partition_id = 'emil';");
		List<Row> result = resultSet.all();
		System.out.println(result.size());
//		result.forEach(row -> {System.out.println(row.getString(1));});
	}

	
	BoundStatement bind(String timer_id) {
	        
	    return preparedStatement.bind(timer_id, UUIDs.timeBased());
	}
	BoundStatement bindDelete(String timer_id) {
        
	    return preparedStatementDelete.bind(timer_id);
	}
	
	
}
