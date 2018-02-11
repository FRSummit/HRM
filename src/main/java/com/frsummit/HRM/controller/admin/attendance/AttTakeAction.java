package com.frsummit.HRM.controller.admin.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttTakeAction {

    @RequestMapping(value = "/admin/attendance-admin-take-action", method = RequestMethod.GET)
    public String attTakeAction(){
        return "attendance_admin_take_action";
    }
}
