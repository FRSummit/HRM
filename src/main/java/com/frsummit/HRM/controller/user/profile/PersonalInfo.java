package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PersonalInfo {

    @RequestMapping(value = "/user/profile-personal-info", method = RequestMethod.GET)
    public String personalInfo(){
        return "profile_personal_info";
    }
}
