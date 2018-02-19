package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.model.User;
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

@Controller
public class LeaveApply {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/leave-user-apply", method = RequestMethod.GET)
    public String leaveApplicationForm(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

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
    public ModelAndView applyForLeave(@Valid Leaves leaves){

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("leaves_user_history");
        return modelAndView;
    }
}
