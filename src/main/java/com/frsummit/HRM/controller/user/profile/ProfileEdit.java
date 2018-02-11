package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfileEdit {

    @RequestMapping(value="/user/profile-edit", method = RequestMethod.GET)
    public String profileEdit(){
        return "profile_edit";
    }
}
