package com.frsummit.HRM.controller.admin.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecentApplications {

    @RequestMapping(value = "/admin/leave-admin-recent", method = RequestMethod.GET)
    public String recentApplicationsLoad(){
        return "leaves_admin_recent";
    }
}
