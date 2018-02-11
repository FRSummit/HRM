package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactInfo {

    @RequestMapping(value = "/user/profile-contact-info", method = RequestMethod.GET)
    public String contactInfo(){
        return "profile_contact_info";
    }
}
