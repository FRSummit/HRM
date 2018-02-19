package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.HRRecordRepository;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.service.HRRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("hrRecordService")
@Transactional
public class HRRecordServiceImpl implements HRRecordService {

    @Autowired
    private HRRecordRepository hrRecordRepository;

    @Override
    public void saveHRRecord(HRRecord hrRecord) {
        hrRecordRepository.save(hrRecord);
    }
}
