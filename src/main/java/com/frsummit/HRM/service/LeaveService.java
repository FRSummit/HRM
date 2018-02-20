package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Leaves;

import java.util.List;

public interface LeaveService {

    public void saveLeave(Leaves leaves);

    //    Admin
    public List<Leaves> findAllLeaves();
    public List<Leaves> findAllLeavesByRole(String userRole);

//    User
    public List<Leaves> findMyAllLeaves(String userId);
}
