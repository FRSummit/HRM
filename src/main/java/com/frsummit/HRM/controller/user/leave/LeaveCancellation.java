package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.model.Leaves;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LeaveCancellation {

    @Autowired
    protected LeaveService leaveService;

    @Autowired
    protected UserService userService;

    @RequestMapping(value = "/user/leave-user-cancellation", method = RequestMethod.GET)
    public String leaveCancellationForm(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;

        String fullName = user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName();

        model.addAttribute("userId", user.getId());
        model.addAttribute("fullName", fullName);

        return "leaves_user_cancellation";
    }

    @RequestMapping(value = "/user/apply-for-leave-cancel", method = RequestMethod.POST)
    public String leaveCancellation(
            @RequestParam(name = "leaveId") int id){

        Leaves leaves = new Leaves("True");
        System.out.println(id);
        leaveService.cancelLeave(leaves, id);
        return "leaves_user_history";
    }
}
