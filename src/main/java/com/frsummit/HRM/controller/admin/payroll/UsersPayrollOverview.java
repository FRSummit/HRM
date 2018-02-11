package com.frsummit.HRM.controller.admin.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsersPayrollOverview {

    @RequestMapping(value = "/admin/payroll-admin-overview", method = RequestMethod.GET)
    public String usersPayrollOverviewTable(){
        return "payroll_admin_overview";
    }
}
