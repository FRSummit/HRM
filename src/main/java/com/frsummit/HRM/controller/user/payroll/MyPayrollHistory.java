package com.frsummit.HRM.controller.user.payroll;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.service.PayrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPayrollHistory {

    @Autowired
    private PayrollService payrollService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/user/payroll-history", method = RequestMethod.GET)
    public String loadMyPayrollHistory(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        model.addAttribute("userPayrollHistory", payrollService.findUserPayrollHistory(myAuthorization.userFromEmailOrId().getId()));
        return "payroll_history";
    }
}
