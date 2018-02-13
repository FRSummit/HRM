package com.frsummit.HRM.controller.user.profile;

import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class ProfileEdit {

    @Autowired
    private UserService userService;

    @RequestMapping(value="/user/profile-edit", method = RequestMethod.GET)
    public String profileEdit(){
        return "profile_edit";
    }

    @RequestMapping(value = "/user/profile-update", method = RequestMethod.GET)
    public ModelAndView editUser(){
        ModelAndView modelAndView = new ModelAndView();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());

        if(user1 != null){
            System.out.println(user1.getEmail());
        }else {
            System.out.println(user2.getId());
        }

        //userService.update(user);

        modelAndView.setViewName("home");
        return modelAndView;
    }
}
