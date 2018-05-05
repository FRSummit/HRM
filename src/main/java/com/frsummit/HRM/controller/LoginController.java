package com.frsummit.HRM.controller;

import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.service.RoleService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(){

        Role role = new Role(1, "ADMIN", "ADMIN");
        roleService.insertRoleAdmin(role);
        userService.createAdmin();
        userService.updateAdmin();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
