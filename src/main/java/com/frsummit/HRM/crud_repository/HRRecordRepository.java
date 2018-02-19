package com.frsummit.HRM.crud_repository;

import com.frsummit.HRM.model.HRRecord;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("hrRecordRepository")
public interface HRRecordRepository extends CrudRepository<HRRecord, Long> {
}
