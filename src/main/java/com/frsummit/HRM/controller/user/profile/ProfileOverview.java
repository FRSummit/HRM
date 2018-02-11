package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfileOverview {

    @RequestMapping(value="/user/profile-overview", method = RequestMethod.GET)
    public String profileOverview(){
        return "profile_overview";
    }
}
