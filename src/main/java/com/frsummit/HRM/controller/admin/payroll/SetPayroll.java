package com.frsummit.HRM.controller.admin.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SetPayroll {

    @RequestMapping(value = "/admin/payroll-admin-set-payment", method = RequestMethod.GET)
    public String setUserPayrollForm(){
        return "payroll_admin_set_payment";
    }
}
