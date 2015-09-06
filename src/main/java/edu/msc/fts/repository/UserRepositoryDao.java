package edu.msc.fts.repository;

import edu.msc.fts.model.User;
import org.springframework.data.repository.CrudRepository;


public interface UserRepositoryDao extends CrudRepository<User, String> {
	
	
	public User findByUsername(String username);

}
