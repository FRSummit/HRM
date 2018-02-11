package com.frsummit.HRM.controller.admin.profile;

import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserList {

    @Autowired
    private UserService userService;

    //@RequestMapping("/admin/users-list")
    @RequestMapping("/admin/profile-user-list")
    public String getUserList(Model model) {
        if(userService.findAllUsers() != null)
            model.addAttribute(userService.findAllUsers());
        return "profile_user_list";
    }

    @RequestMapping(value = "/admin/list-user-edit", method = RequestMethod.GET)
    public String getUserListEditAction(@RequestParam String edit, @RequestParam String remove) {
        System.out.println("Edit / Delete Clicked" + edit + " " + remove);

        return "profile_user_list";
    }
}
