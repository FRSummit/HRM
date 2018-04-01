package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeaveHistoryAdmin {

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/admin/leaves-admin-history", method = RequestMethod.GET)
    public String leaveHistoryAdminLoad(Model model){

        model.addAttribute(leaveService.findAllLeavesByRole(myAuthorization.userFromEmailOrId().getMyRole()));

        return "leaves_admin_history";
    }
}
