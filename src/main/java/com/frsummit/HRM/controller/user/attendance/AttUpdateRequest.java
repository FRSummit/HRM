package com.frsummit.HRM.controller.user.attendance;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.AttendanceService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttUpdateRequest {

    @Autowired
    private UserService userService;

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/attendance-user-overview-update-request", method = RequestMethod.GET)
    public String attUpdateRequestForm(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());

        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;*/

        //model.addAttribute("userId", user.getId());
        model.addAttribute("userId", myAuthorization.userFromEmailOrId().getId());
        //model.addAttribute("fullName", user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName());
        model.addAttribute("fullName", myAuthorization.userFromEmailOrId().getFirstName() + " " +
                myAuthorization.userFromEmailOrId().getMiddleName() + " " +
                myAuthorization.userFromEmailOrId().getLastName());
        //model.addAttribute("designation", user.getDesignation());
        model.addAttribute("designation", myAuthorization.userFromEmailOrId().getDesignation());
        //model.addAttribute("department", user.getDepartment());
        model.addAttribute("department", myAuthorization.userFromEmailOrId().getDepartment());
        return "attendance_user_update_request";
    }

    @RequestMapping(value = "/user/attendance-request", method = RequestMethod.GET)
    public String updateAttendanceRequest(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        return "home";
    }
}
