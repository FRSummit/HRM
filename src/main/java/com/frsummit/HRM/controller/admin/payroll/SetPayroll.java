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
    public String setUserPayrollForm(){
        return "payroll_admin_set_payment";
    }

    @RequestMapping(value = "/admin/set-payment", method = RequestMethod.POST)
    public ModelAndView createNewUser(Model model, @Valid Payroll payroll) {

        System.out.println(payroll);



        ModelAndView modelAndView = new ModelAndView();
            //modelAndView.setViewName("home");
            modelAndView.setViewName("payroll_admin_set_payment");
        return modelAndView;
    }
}
