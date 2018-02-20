package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecentApplications {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @RequestMapping(value = "/admin/leave-admin-recent", method = RequestMethod.GET)
    public String recentApplicationsLoad(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;

        System.out.println(user.getMyRole());
        model.addAttribute("leavesList",leaveService.findAllLeavesByRole(user.getMyRole()));

        return "leaves_admin_recent";
    }
}
