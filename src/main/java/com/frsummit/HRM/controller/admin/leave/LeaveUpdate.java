package com.frsummit.HRM.controller.admin.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveUpdate {

    @RequestMapping(value = "/admin/leave-admin-update", method = RequestMethod.GET)
    public String leaveUpdateForm(){
        return "leaves_admin_update";
    }
}
