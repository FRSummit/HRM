package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LeaveReportConsolidated {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HRRecordService hrRecordService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/admin/leaves-employee-record-consolidated", method = RequestMethod.GET)
    public String getLeaveReportConsolidated(Model model){
        model.addAttribute("hrRecordList", hrRecordService.findAllHRRecords());
        return "leaves-report-consolidated";
    }

    @RequestMapping(value = "/admin/leave-record-consolidated-selected-date", method = RequestMethod.POST)
    public String getLeaveReportConsolidatedSelectedByDate(
            @RequestParam(value = "department") String department,
            @RequestParam(value = "dateFrom") String dateFrom,
            @RequestParam(value = "dateTo") String dateTo,
            Model model){

        List<HRRecord> hrRecordList = hrRecordService.findAllHRRecords();

        return "leaves-report-consolidated";
    }
}
