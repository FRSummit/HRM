package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.PayrollReppository;
import com.frsummit.HRM.model.Payroll;
import com.frsummit.HRM.service.PayrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service("payrollService")
@Transactional
public class PayrollServiceImpl implements PayrollService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private PayrollReppository payrollReppository;

/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Application Properties //////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

    @Value("${spring.queries.all-user-payroll}") //all user payroll
    private String allUsersPayroll;

    @Value("${spring.queries.specific-user-payroll}") //specific user payroll
    private String specificUserPayroll;

    @Value("${spring.queries.user-current-payroll}") //user current payroll by userId
    private String userCurrentPayroll;

    @Value("${spring.queries.user-payroll-history}") //user payroll history by userId
    private String userPayrollHistory;


/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Services Start //////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public void savePayroll(Payroll payroll) {
        payrollReppository.save(payroll);
    }

//////////////////////////////////////
/////    Admin Section    ////////////
//////////////////////////////////////
    @Override
    public List<Payroll> findAllUsersPayroll() {
        return entityManager.createQuery(allUsersPayroll, Payroll.class).getResultList();
    }

    @Override
    public List<Payroll> findSpecificUserPayroll(String userId) {
        return entityManager.createQuery(specificUserPayroll + userId + "'", Payroll.class).getResultList();
    }


    ////////////////////////////////////
////    User Section    ////////////
////////////////////////////////////
    @Override
    public List<Payroll> findUserCurrentPayroll(String userId) {
        return entityManager.createQuery(userCurrentPayroll + userId + "'", Payroll.class).getResultList();
    }

    @Override
    public List<Payroll> findUserPayrollHistory(String userId) {
        return entityManager.createQuery(userPayrollHistory + userId + "'", Payroll.class).getResultList();
    }
}
