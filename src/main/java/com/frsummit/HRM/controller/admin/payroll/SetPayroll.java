package com.frsummit.HRM.controller.admin.payroll;

import com.frsummit.HRM.config.ConfigAuth;
import com.frsummit.HRM.model.Payroll;
import com.frsummit.HRM.service.PayrollService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private PayrollService payrollService;

    @Autowired
    private ConfigAuth configAuth;

    @RequestMapping(value = "/admin/payroll-admin-set-payment", method = RequestMethod.GET)
    public ModelAndView setUserPayrollForm(Model model){
        ModelAndView modelAndView = new ModelAndView();
        Payroll payroll = new Payroll();
        modelAndView.addObject("payroll", payroll);
        modelAndView.setViewName("payroll_admin_set_payment");

        model.addAttribute("myConfigEarnEdu", configAuth.configName().getPayroll_earning_educational());
        model.addAttribute("myConfigEarnBonus", configAuth.configName().getPayroll_earning_bonus());
        model.addAttribute("myConfigEarnIncentive", configAuth.configName().getPayroll_earning_incentive());
        model.addAttribute("myConfigEarnLeaveEncasement", configAuth.configName().getPayroll_earning_leaveEncasement());
        model.addAttribute("myConfigEarnPerquisite", configAuth.configName().getPayroll_earning_perquisite());
        model.addAttribute("myConfigEarnReimbursement", configAuth.configName().getPayroll_earning_reimbursement());
        model.addAttribute("myConfigEarnSpecial", configAuth.configName().getPayroll_earning_special());
        model.addAttribute("myConfigEarnOverTime", configAuth.configName().getPayroll_earning_overtime());
        model.addAttribute("myConfigEarnArrears", configAuth.configName().getPayroll_earning_arrears());
        model.addAttribute("myConfigEarnChildFund", configAuth.configName().getPayroll_earning_childFund());
        model.addAttribute("myConfigEarnStipen", configAuth.configName().getPayroll_earning_stipen());

        model.addAttribute("myConfigDedTds", configAuth.configName().getPayroll_deduction_tds());
        model.addAttribute("myConfigDedInterest", configAuth.configName().getPayroll_deduction_interest());
        model.addAttribute("myConfigDedPF", configAuth.configName().getPayroll_deduction_pf());
        model.addAttribute("myConfigDedProfessionalTex", configAuth.configName().getPayroll_deduction_professionalTex());
        model.addAttribute("myConfigDedAdvancedOrLoan", configAuth.configName().getPayroll_deduction_advancedOrLoan());
        model.addAttribute("myConfigDedOther", configAuth.configName().getPayroll_deduction_other());
        model.addAttribute("myConfigDedLeave", configAuth.configName().getPayroll_deduction_leave());
        model.addAttribute("myConfigDedSecurityDeposit", configAuth.configName().getPayroll_deduction_securityDeposite());

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

        if(!userId.equalsIgnoreCase(null)){
            System.out.println(payroll);
            System.out.println(userId);
            System.out.println(userId.length());
            payrollService.savePayroll(payroll);
            modelAndView.setViewName("home");
        }
        else
            modelAndView.setViewName("payroll_admin_set_payment");
        return modelAndView;
    }
}
