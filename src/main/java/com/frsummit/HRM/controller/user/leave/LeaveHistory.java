package com.frsummit.HRM.controller.user.leave;

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
public class LeaveHistory {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @RequestMapping(value = "/user/leave-user-history", method = RequestMethod.GET)
    public String leaveHistoryLoad(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;

        model.addAttribute("leavesList",leaveService.findMyAllLeaves(user.getId()));

        return "leaves_user_history";
    }
}
