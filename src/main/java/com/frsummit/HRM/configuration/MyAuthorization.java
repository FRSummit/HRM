package com.frsummit.HRM.configuration;

import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("myAuthorization")
public class MyAuthorization {

    @Autowired
    private UserService userService;

    public User userFromEmailOrId(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;
        return user;
    }

    public Model getRoleForCommonLayout(Model model){
        return model.addAttribute("model", userFromEmailOrId().getMyRole());
    }
}
