package com.frsummit.HRM.service;

import com.frsummit.HRM.model.HRRecord;

import java.util.List;

public interface HRRecordService {

    public void saveHRRecord(HRRecord hrRecord);
    public List<HRRecord> getAllRecord(String userId);
    public List<HRRecord> getAllRecordByDept(String department);
    public List<HRRecord> findAllHRRecords();

    public void updateHRRecord(String userId, String leaveName, int totalLeaveTaken, int totalLeaveBalance);
}
