package com.frsummit.HRM.controller.user.profile;

import com.frsummit.HRM.configuration.MyAuthorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactInfo {

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/profile-contact-info", method = RequestMethod.GET)
    public String contactInfo(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        model.addAttribute("fullName", myAuthorization.userFullName());
        model.addAttribute("designation", myAuthorization.userFromEmailOrId().getDesignation());
        model.addAttribute("firstName", myAuthorization.userFromEmailOrId().getFirstName());
        model.addAttribute("middleName", myAuthorization.userFromEmailOrId().getMiddleName());
        model.addAttribute("lastName", myAuthorization.userFromEmailOrId().getLastName());
        model.addAttribute("phone", myAuthorization.userFromEmailOrId().getPhone());
        //model.addAttribute("district", myAuthorization.userFromEmailOrId().getPresentAddress().getDistrict());
        return "profile_contact_info";
    }
}
