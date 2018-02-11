package com.frsummit.HRM.jpa_repository;

import com.frsummit.HRM.model.Leaves;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("leaveRepository")
public interface LeaveRepository extends CrudRepository<Leaves, Integer> {
}
