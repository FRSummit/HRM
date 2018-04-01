package com.frsummit.HRM.controller.user.payroll;

import com.frsummit.HRM.configuration.MyAuthorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPayroll {

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/payroll-my-payment", method = RequestMethod.GET)
    public String loadMyPayroll(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        return "payroll_my_payment";
    }
}
