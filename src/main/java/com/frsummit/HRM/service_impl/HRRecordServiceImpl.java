package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.HRRecordRepository;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.service.HRRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Service("hrRecordService")
@Transactional
public class HRRecordServiceImpl implements HRRecordService {

    @Autowired
    private HRRecordRepository hrRecordRepository;

    @Autowired
    protected EntityManager entityManager;

    @Override
    public void saveHRRecord(HRRecord hrRecord) {
        hrRecordRepository.save(hrRecord);
    }

    @Override
    public List<HRRecord> getAllRecord(String userId) {
        return entityManager.createQuery("select hr from HRRecord as hr where hr.userId = '" + userId + "'", HRRecord.class).getResultList();
    }
}
