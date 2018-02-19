package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.configuration.LeaveConfiguration;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.RoleService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class LeaveApply {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/user/leave-user-apply", method = RequestMethod.GET)
    public String leaveApplicationForm(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;

        if(user1 != null) user = user1;
        else user = user2;

//        Employee Details
        model.addAttribute("titleId", user.getId());
        String firstName = user.getFirstName();
        String middleName = user.getMiddleName();
        String lastName = user.getLastName();
        firstName = firstName != null ? firstName : "";
        middleName = middleName != null ? middleName : "";
        lastName = lastName != null ? lastName : "";
        model.addAttribute("titleFullName", firstName + " " + middleName + " " + lastName);
        model.addAttribute("titleDepartment", user.getDepartment());

        return "leaves_user_apply";
    }

    @RequestMapping(value = "/user/apply-for-leave", method = RequestMethod.POST)
    public ModelAndView applyForLeave(){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;

        if(user1 != null) user = user1;
        else user = user2;

        ModelAndView modelAndView = new ModelAndView();
        LeaveConfiguration leaveConfiguration = new LeaveConfiguration();
        List<Role> roleList = roleService.findAllRole(user.getMyRole());
        Role role = roleList.get(0);
        String applyToWhom = leaveConfiguration.mapForNextRole(role.getRole(), role.getRoleChain());
        System.out.println("Apply To : " + applyToWhom);
        Leaves leaves1 = new Leaves();

        modelAndView.setViewName("leaves_user_history");
        return modelAndView;
    }
}
