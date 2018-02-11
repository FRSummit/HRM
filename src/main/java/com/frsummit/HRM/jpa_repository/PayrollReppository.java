package com.frsummit.HRM.jpa_repository;

import com.frsummit.HRM.model.Payroll;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("payrollRepository")
public interface PayrollReppository extends CrudRepository<Payroll, Integer> {
}
