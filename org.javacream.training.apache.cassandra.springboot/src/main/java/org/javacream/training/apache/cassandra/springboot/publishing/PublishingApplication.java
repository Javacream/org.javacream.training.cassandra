package org.javacream.training.apache.cassandra.springboot.publishing;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PublishingApplication {

	@Autowired private PublishingRepository publishingRepository;
	
	@PostConstruct public void startApplication() {
		Book cassandraInAction1 = new Book("Manning", 100, 19.99, "ISBN-1", false, "Cassandra in Action");
		publishingRepository.save(cassandraInAction1);
		Book cassandraInAction2 = new Book("Manning", 200, 29.99, "ISBN-2", true, "Cassandra in Action");
		publishingRepository.save(cassandraInAction2);
		Book cassandraInAction3 = new Book("Manning", 500, 39.99, "ISBN-3", true, "Cassandra in Action");
		publishingRepository.save(cassandraInAction3);
		Book java = new Book("Manning", 5000, 9.99, "ISBN-4", true, "Java");
		publishingRepository.save(java);
	}
}
