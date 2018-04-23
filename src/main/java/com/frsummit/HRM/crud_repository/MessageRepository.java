package com.frsummit.HRM.crud_repository;

import com.frsummit.HRM.model.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("messageRepository")
public interface MessageRepository extends CrudRepository<Message, Long> {
}
