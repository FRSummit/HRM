package com.frsummit.HRM.controller.user.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttSign {

    @RequestMapping(value = "/user/attendance-user-punch", method = RequestMethod.GET)
    public String attSignForm(){
        return "attendance_user_punch";
    }
}
