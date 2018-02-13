package com.frsummit.HRM.controller.admin.profile;

import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UpdateUser {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/profile-user-update", method = RequestMethod.GET)
    public String updateUser(){
        return "profile_user_update";
    }

    @RequestMapping(value = "/admin/profile-update", method = RequestMethod.GET)
    public ModelAndView updateUser(@Valid User user, BindingResult bindingResult, Model model,
                                   @RequestParam(value = "firstName") String firstName,
                                   @RequestParam(value = "userRole") String userRole){
        ModelAndView modelAndView = new ModelAndView();
        userService.saveUser(user, userRole);
        System.out.println(firstName);
        modelAndView.setViewName("profile_user_list");
        return modelAndView;
    }
}
