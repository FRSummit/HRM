package com.frsummit.HRM.service;

import com.frsummit.HRM.model.HRRecord;

import java.util.List;

public interface HRRecordService {

    public void saveHRRecord(HRRecord hrRecord);
    public List<HRRecord> getAllRecord(String userId);
}
