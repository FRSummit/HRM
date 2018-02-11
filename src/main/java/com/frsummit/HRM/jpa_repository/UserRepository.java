package com.frsummit.HRM.jpa_repository;

import com.frsummit.HRM.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Long> {

    User findByEmail(String email);
//    User findByName(String name);
//    User findById(String id);
}
