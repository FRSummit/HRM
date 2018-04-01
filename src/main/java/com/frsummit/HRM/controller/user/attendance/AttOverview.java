package com.frsummit.HRM.controller.user.attendance;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttOverview {

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/attendance-user-overview", method = RequestMethod.GET)
    public String attOverviewLoad(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        model.addAttribute("attendanceList", attendanceService.myAllSignList());
        return "attendance_user_overview";
    }
}
