package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.UserRepository;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.ComService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("comService")
@Transactional
public class ComServiceImpl implements ComService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUserIdOrEmail() {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userRepository.findByEmail(auth.getName());
        User user2 = userRepository.findById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;
        return user;
    }
}
