package com.frsummit.HRM.controller;

import com.frsummit.HRM.configuration.LeaveConfiguration;
import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.RoleService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value="/home", method = RequestMethod.GET)
    public String home(){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserByEmail(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;
        List<Role> roleList = roleService.findAllRole(user.getMyRole());
        Role role = roleList.get(0);
        System.out.println(role.getId());
        System.out.println(role.getRole());
        System.out.println(role.getRoleChain());

        LeaveConfiguration leaveConfiguration = new LeaveConfiguration();
        leaveConfiguration.mapForRole(role.getRole(), role.getRoleChain());

        return "home";
    }
}
