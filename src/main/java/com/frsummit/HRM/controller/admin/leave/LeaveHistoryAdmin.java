package com.frsummit.HRM.controller.admin.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveHistoryAdmin {

    @RequestMapping(value = "/admin/leaves-admin-history", method = RequestMethod.GET)
    public String leaveHistoryAdminLoad(){
        return "leaves_admin_history";
    }
}
