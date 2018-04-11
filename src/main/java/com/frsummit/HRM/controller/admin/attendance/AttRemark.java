package com.frsummit.HRM.controller.admin.attendance;

import com.frsummit.HRM.model.Attendance;
import com.frsummit.HRM.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttRemark {

    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping(value = "/admin/attendance-admin-remark", method = RequestMethod.GET)
    public String attRemark(Model model){
        model.addAttribute("attendanceList", attendanceService.remarkAttendanceList());
        return "attendance_admin_remark";
    }

    @RequestMapping(value = "/admin/attendance-remove-from-remark-list", method = RequestMethod.GET)
    public String removeFromRemark(@RequestParam(value = "attendId") String attendId, Model model){
        attendanceService.removeFromRemarkList(attendId);
        model.addAttribute("attendanceList", attendanceService.remarkAttendanceList());
        return "attendance_admin_remark";
    }
}
