package com.frsummit.HRM.controller.admin.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttUpdate {

    @RequestMapping(value = "/admin/attendance-admin-update", method = RequestMethod.GET)
    public String attUpdateAdmin(){
        return "attendance_admin_update";
    }
}
