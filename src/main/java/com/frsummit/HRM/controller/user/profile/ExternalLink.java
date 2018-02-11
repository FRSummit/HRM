package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExternalLink {

    @RequestMapping(value = "/user/profile-external-link", method = RequestMethod.GET)
    public String externalLink(){
        return "profile_external_link";
    }
}
