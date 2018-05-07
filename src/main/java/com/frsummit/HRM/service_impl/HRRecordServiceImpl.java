package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.HRRecordRepository;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.service.HRRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Service("hrRecordService")
@Transactional
public class HRRecordServiceImpl implements HRRecordService {

    @Autowired
    private HRRecordRepository hrRecordRepository;

    @Autowired
    protected EntityManager entityManager;



    @Value("${spring.queries.hrrecord-by-department}")
    private String query1;

    @Override
    public void saveHRRecord(HRRecord hrRecord) {
        hrRecordRepository.save(hrRecord);
    }

    @Override
    public List<HRRecord> getAllRecord(String userId) {
        return entityManager.createQuery("select hr from HRRecord as hr where hr.userId = '" + userId + "'", HRRecord.class).getResultList();
    }

    @Override
    public List<HRRecord> getAllRecordByDept(String department) {
        return entityManager.createQuery(query1 + department + "'", HRRecord.class).getResultList();
    }

    @Override
    public List<HRRecord> findAllHRRecords() {
        return entityManager.createQuery("SELECT hr FROM HRRecord AS hr", HRRecord.class).getResultList();
    }

    @Override
    @Modifying
    public void updateHRRecord(String userId, String leaveName, int totalLeaveTaken, int totalLeaveBalance) {
        Query query = entityManager.createQuery("UPDATE HRRecord hr SET hr.totalLeaveTaken" + leaveName + " = " + totalLeaveTaken + ", hr.leaveBalance" + leaveName + " = " + totalLeaveBalance + " WHERE hr.userId='" + userId +"'");
        query.executeUpdate();
    }
}
