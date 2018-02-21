package com.frsummit.HRM.controller.admin.payroll;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SetPayroll {

    @RequestMapping(value = "/admin/payroll-admin-set-payment", method = RequestMethod.GET)
    public String setUserPayrollForm(){
        return "payroll_admin_set_payment";
    }

    @RequestMapping(value = "/admin/set-payment", method = RequestMethod.POST)
    public ModelAndView createNewUser(
            Model model,
            @RequestParam(value = "userId") String id) {

        //System.out.println(basic + " " + basicCheck);
        String[] part = id.split("");
        for(int i=0; i<id.length(); i++){
            if(part[i].equalsIgnoreCase("%"))
                System.out.println(id + "this is a persent");
            else
                System.out.println("no persent");
        }


        ModelAndView modelAndView = new ModelAndView();
            //modelAndView.setViewName("home");
            modelAndView.setViewName("payroll_admin_set_payment");
        return modelAndView;
    }
}
