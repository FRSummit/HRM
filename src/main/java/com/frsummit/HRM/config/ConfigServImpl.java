package com.frsummit.HRM.config;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("configServe")
@Transactional
public class ConfigServImpl implements ConfigServe {

    @Override
    public void saveProfileConfig() {
        System.out.println("Profile");
    }

    @Override
    public void saveLeaveConfig() {
        System.out.println("Leave");
    }

    @Override
    public void savePayrollEarningConfig() {
        System.out.println("Payroll Earning");
    }

    @Override
    public void savePayrollDeductionConfig() {
        System.out.println("Payroll Deduction");
    }
}
