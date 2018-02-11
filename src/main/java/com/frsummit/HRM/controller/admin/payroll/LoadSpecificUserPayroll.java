package com.frsummit.HRM.controller.admin.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoadSpecificUserPayroll {

    @RequestMapping(value = "/admin/payroll-load-specific-user", method = RequestMethod.GET)
    public String specificUserPayrollLoad(){
        return "payroll_load_specific_user";
    }
}
