package com.frsummit.HRM.controller.user.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPayrollHistory {

    @RequestMapping(value = "/user/payroll-history", method = RequestMethod.GET)
    public String loadMyPayrollHistory(){
        return "payroll_history";
    }
}
