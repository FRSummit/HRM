package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Leaves;

import java.util.List;

public interface LeaveService {

//    Admin
    public void saveLeave(Leaves leaves);
    public List<Leaves> findAllLeaves();

//    User

    public List<Leaves> findMyAllLeaves(String userId);
}
