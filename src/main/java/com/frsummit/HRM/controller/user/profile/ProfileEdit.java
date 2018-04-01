package com.frsummit.HRM.controller.user.profile;

import com.frsummit.HRM.configuration.MyAuthorization;
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

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value="/user/profile-edit", method = RequestMethod.GET)
    public String profileEdit(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        return "profile_edit";
    }

    @RequestMapping(value = "/user/profile-update", method = RequestMethod.GET)
    public ModelAndView editUser(){
        ModelAndView modelAndView = new ModelAndView();

        //userService.update(user);

        modelAndView.setViewName("home");
        return modelAndView;
    }

}
