package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LeaveUpdate {

    @Autowired
    protected LeaveService leaveService;

    @RequestMapping(value = "/admin/leave-admin-update", method = RequestMethod.GET)
    public String leaveUpdateForm(){
        return "leaves_admin_update";
    }

    @RequestMapping(value = "/admin/update-leave", method = RequestMethod.GET)
    public String leaveUpdate(
            @RequestParam(value = "leaveId") String leaveId,
            @RequestParam(value = "leaveStatus") String leaveStatus){

        leaveService.updateLeave(leaveId, leaveStatus);
        return "leaves_admin_update";
    }
}
