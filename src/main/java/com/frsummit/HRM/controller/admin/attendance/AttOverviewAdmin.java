package com.frsummit.HRM.controller.admin.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttOverviewAdmin {

    @RequestMapping(value = "/admin/attendance-admin-overview", method = RequestMethod.GET)
    public String attOverviewAdminLoad(){
        return "attendance_admin_overview";
    }
}
