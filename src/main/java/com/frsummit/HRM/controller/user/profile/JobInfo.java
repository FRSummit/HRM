package com.frsummit.HRM.controller.user.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JobInfo {

    @RequestMapping(value = "/user/profile-job-info", method = RequestMethod.GET)
    public String jobInfo(){
        return "profile_job_info";
    }
}
