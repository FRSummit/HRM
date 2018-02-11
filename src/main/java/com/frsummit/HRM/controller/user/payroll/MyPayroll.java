package com.frsummit.HRM.controller.user.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPayroll {

    @RequestMapping(value = "/user/payroll-my-payment", method = RequestMethod.GET)
    public String loadMyPayroll(){
        return "payroll_my_payment";
    }
}
