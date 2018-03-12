package com.frsummit.HRM.controller.admin.payroll;

import com.frsummit.HRM.service.PayrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsersPayrollOverview {

    @Autowired
    private PayrollService payrollService;

    @RequestMapping(value = "/admin/payroll-admin-overview", method = RequestMethod.GET)
    public String usersPayrollOverviewTable(Model model){
        model.addAttribute("allUsersPayrollHistory", payrollService.findAllUsersPayroll());
        return "payroll_admin_overview";
    }
}
