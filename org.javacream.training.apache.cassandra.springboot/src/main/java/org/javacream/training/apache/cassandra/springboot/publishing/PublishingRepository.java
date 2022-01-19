package org.javacream.training.apache.cassandra.springboot.publishing;

import org.springframework.data.cassandra.repository.CassandraRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PublishingRepository extends CassandraRepository<Book, String>{

}
