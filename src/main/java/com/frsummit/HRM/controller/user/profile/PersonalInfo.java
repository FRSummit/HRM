package com.frsummit.HRM.controller.user.profile;

import com.frsummit.HRM.configuration.MyAuthorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PersonalInfo {

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/profile-personal-info", method = RequestMethod.GET)
    public String personalInfo(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        return "profile_personal_info";
    }
}
