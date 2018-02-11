package com.frsummit.HRM.controller.user.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveApply {

    @RequestMapping(value = "/user/leave-user-apply", method = RequestMethod.GET)
    public String leaveApplicationForm(){
        return "leaves_user_apply";
    }
}
