package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Payroll;

import java.util.List;

public interface PayrollService {

    public void savePayroll(Payroll payroll);

//////////////////////////////////////
/////    Admin Section    ////////////
//////////////////////////////////////

//////////////////////////////////////
/////    User Section    ////////////
//////////////////////////////////////

    public List<Payroll> findUserCurrentPayroll(String userId);
    public List<Payroll> findUserPayrollHistory(String userId);
}
