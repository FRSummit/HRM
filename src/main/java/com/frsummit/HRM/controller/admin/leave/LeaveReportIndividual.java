package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LeaveReportIndividual {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HRRecordService hrRecordService;

    @Autowired
    private MyAuthorization myAuthorization;

    public String getLeaveReportIndividual(){

        return "leaves-report-individual";
    }
}
