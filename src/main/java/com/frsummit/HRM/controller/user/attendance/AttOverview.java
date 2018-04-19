package com.frsummit.HRM.controller.user.attendance;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.Attendance;
import com.frsummit.HRM.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Calendar;
import java.util.List;

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

        /*List<Attendance> attList = attendanceService.myAllSignList();
        for(int i=0; i<attList.size()-1; i++){
            Attendance attendance = attList.get(i);

            String time = attendance.getSignTime().toString();
            System.out.println("time : = " + time);
            String[] parts = time.split(" ");
            for(int j=0; j<parts.length; j++){
                System.out.println(parts[j]);
            }
        }*/
        return "attendance_user_overview";
    }
}
