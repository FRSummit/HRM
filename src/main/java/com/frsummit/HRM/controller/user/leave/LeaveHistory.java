package com.frsummit.HRM.controller.user.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveHistory {

    @RequestMapping(value = "/user/leave-user-history", method = RequestMethod.GET)
    public String leaveHistoryLoad(){
        return "leaves_user_history";
    }
}
