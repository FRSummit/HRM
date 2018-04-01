package com.frsummit.HRM.controller.admin.attendance;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttOverviewAdmin {

    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping(value = "/admin/attendance-admin-overview", method = RequestMethod.GET)
    public String attOverviewAdminLoad(Model model){
        model.addAttribute("attendanceList", attendanceService.UsersSignList());
        return "attendance_admin_overview";
    }
}
