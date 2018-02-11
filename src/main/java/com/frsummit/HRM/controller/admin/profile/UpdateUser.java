package com.frsummit.HRM.controller.admin.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UpdateUser {

    @RequestMapping(value = "/admin/profile-user-update", method = RequestMethod.GET)
    public String updateUser(){
        return "profile_user_update";
    }
}
