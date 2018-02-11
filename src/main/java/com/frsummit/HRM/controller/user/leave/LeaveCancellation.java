package com.frsummit.HRM.controller.user.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveCancellation {

    @RequestMapping(value = "/user/leave-user-cancellation", method = RequestMethod.GET)
    public String leaveCancellationForm(){
        return "leaves_user_cancellation";
    }
}
