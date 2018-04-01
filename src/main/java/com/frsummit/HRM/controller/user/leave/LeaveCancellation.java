package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
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

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/leave-user-cancellation", method = RequestMethod.GET)
    public String leaveCancellationForm(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;*/

        //String fullName = user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName();
        String fullName = myAuthorization.userFromEmailOrId().getFirstName() + " " +
                myAuthorization.userFromEmailOrId().getMiddleName() + " " +
                myAuthorization.userFromEmailOrId().getLastName();

        //model.addAttribute("userId", user.getId());
        model.addAttribute("userId", myAuthorization.userFromEmailOrId().getId());
        model.addAttribute("fullName", fullName);

        return "leaves_user_cancellation";
    }

    @RequestMapping(value = "/user/leave-cancellation", method = RequestMethod.GET)
    public String leaveCancellation(
            @RequestParam(name = "leaveId") int id){

        System.out.println("0");
        leaveService.cancelLeave(id);
        System.out.println("2");
        return "leaves_user_history";
    }
}
