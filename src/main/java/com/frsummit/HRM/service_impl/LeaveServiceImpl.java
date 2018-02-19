package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.LeaveRepository;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("leaveService")
@Transactional
public class LeaveServiceImpl implements LeaveService {

    @Autowired
    private LeaveRepository leaveRepository;

    @Override
    public void saveLeave(Leaves leaves) {
        leaveRepository.save(leaves);
    }
}
