package com.frsummit.HRM.controller.admin.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttRemark {

    @RequestMapping(value = "/admin/attendance-admin-remark", method = RequestMethod.GET)
    public String attRemark(){
        return "attendance_admin_remark";
    }
}
