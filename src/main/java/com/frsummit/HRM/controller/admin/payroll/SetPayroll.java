package com.frsummit.HRM.controller.admin.payroll;

import com.frsummit.HRM.model.Payroll;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class SetPayroll {

    @RequestMapping(value = "/admin/payroll-admin-set-payment", method = RequestMethod.GET)
    public ModelAndView setUserPayrollForm(){
        ModelAndView modelAndView = new ModelAndView();
        Payroll payroll = new Payroll();
        modelAndView.addObject("payroll", payroll);
        modelAndView.setViewName("payroll_admin_set_payment");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/set-payment", method = RequestMethod.POST)
    public ModelAndView setPayroll(@Valid Payroll payroll,
            @RequestParam(value = "userId") String userId
            /*@RequestParam(value = "basic") String basic,
            @RequestParam(value = "houseRent") String houseRent,
            @RequestParam(value = "convince") String convince,
            @RequestParam(value = "medical") String medical,
            @RequestParam(value = "advancedOrLoan") String advancedOrLoan,
            @RequestParam(value = "interest") String interest,
            @RequestParam(value = "otherAll") String otherAll,
            @RequestParam(value = "educational") String educational,
            @RequestParam(value = "bonus") String bonus,
            @RequestParam(value = "incentive") String incentive,
            @RequestParam(value = "leaveEncasement") String leaveEncasement,
            @RequestParam(value = "perquisite") String perquisite,
            @RequestParam(value = "reimbursement") String reimbursement,
            @RequestParam(value = "special") String special,
            @RequestParam(value = "overtime") String overtime,
            @RequestParam(value = "arrears") String arrears,
            @RequestParam(value = "childFund") String childFund,
            @RequestParam(value = "stipen") String stipen,
            @RequestParam(value = "tds") String tds,
            @RequestParam(value = "interestDED") String interestDED,
            @RequestParam(value = "pfDED") String pfDED,
            @RequestParam(value = "professionalTexDED") String professionalTexDED,
            @RequestParam(value = "advancedOrLoanDED") String advancedOrLoanDED,
            @RequestParam(value = "otherDED") String otherDED,
            @RequestParam(value = "leaveDED") String leaveDED,
            @RequestParam(value = "securityDepositDED") String securityDepositDED*/) {

        ModelAndView modelAndView = new ModelAndView();

        if(userId.equalsIgnoreCase(null) || userId.length() <2)
            modelAndView.setViewName("payroll_admin_set_payment");
        else{
            System.out.println(payroll);
            System.out.println(userId);
            System.out.println(userId.length());
            modelAndView.setViewName("home");
        }
        return modelAndView;
    }
}
