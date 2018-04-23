package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.MessageRepository;
import com.frsummit.HRM.crud_repository.UserRepository;
import com.frsummit.HRM.model.Message;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Value("${spring.queries.my-Messages-list}")
    private String loadMyAllMessageFromDb;

    @Value("${spring.queries.messages-list}")
    private String loadAllMessageFromDb;

    @Override
    public void saveMessage(Message message) {
        messageRepository.save(message);
    }

    @Override
    public List<Message> findMessage() {
        return entityManager.createQuery("SELECT m FROM Message WHERE m.messageUserId = '" + myId() + "' AND m.messageCheck = 'UnCheck'", Message.class).getResultList();
    }

    @Override
    public List<Message> findMyALLMessage() {
        return entityManager.createQuery(loadMyAllMessageFromDb + myId() + "'", Message.class).getResultList();
    }

    @Override
    public List<Message> loadALLMessage() {
        return entityManager.createQuery(loadAllMessageFromDb, Message.class).getResultList();
    }

    public String myId(){
        String myId;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByEmail(auth.getName());
        myId = u.getId().toString();
        return myId;
    }
}
