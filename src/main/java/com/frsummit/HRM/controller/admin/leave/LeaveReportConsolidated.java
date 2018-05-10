package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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

        List<User> userList = userService.findUserByDepartment(department);
        List<HRRecord> hrRecordList =hrRecordService.findAllHRRecords();
        List<Leaves> leavesList = leaveService.findAllLeaves();
//        System.out.println(leavesList);

//        List<String> userIdList = new ArrayList<>();
//        System.out.println("this :" + userList);
//        User user;
//        System.out.println(userList.size());
//        for(int i=0; i<userList.size()-1; i++){
//            user = userList.get(i);
//            userIdList.add(user.getId());
//        }
//        System.out.println("This");
//        System.out.println(userIdList);
//        System.out.println(userIdList.size());

        if(userList.size() !=0 && hrRecordList.size() != 0 && leavesList.size() !=0) {
//          Put value from database to array list
            List<User> userList1 = new ArrayList<>();
            List<HRRecord> hrRecordList1 = new ArrayList<>();
            for(int i=0; i<hrRecordList.size()-1; i++){
                User user1 = userList.get(i);
                userList1.add(user1);

                List<HRRecord> hrByUserId = hrRecordService.getAllRecord(user1.getId());
                HRRecord hrRecordById = hrByUserId.get(0);
                hrRecordList1.add(hrRecordById);

//                HRRecord hrRecord = hrRecordList.get(i);
//                hrRecordList1.add(hrRecord);
            }

            List<Leaves> leavesList1 = new ArrayList<>();
            for(int i=0; i<leavesList.size(); i++){
                Leaves leaves = leavesList.get(i);
                leavesList1.add(leaves);
            }

//        Put userId from ArrayList to new userId ArrayList
            List<String> userId = new ArrayList<>();
            List<String> hrUserId = new ArrayList<>();
            for(int i=0; i<hrRecordList1.size(); i++){
                userId.add(userList1.get(i).getId());
                hrUserId.add(hrRecordList1.get(i).getUserId());
            }

            System.out.println(userId.get(0) + " " + hrUserId.get(0));

            List<String> leaveUserId = new ArrayList<>();
            for(int i=0; i<leavesList1.size(); i++){
                leaveUserId.add(leavesList1.get(i).getUserId());
            }

//        Select specific hr record from same userId
            List<HRRecord> hrRecordList2 = new ArrayList<>();
            for(int i=0; i<userId.size(); i++){
                for(int j=0; j<=hrUserId.size()-1; j++){
                    if(userId.get(i).equalsIgnoreCase(hrUserId.get(j))){
//                        System.out.println(userId.get(i) + " " + hrUserId.get(j));
                        String id = hrUserId.get(j);
                        hrRecordList2.add(hrRecordList1.get(j));
                    }
                }
            }

            String dateFrm = dateFrom.toString();
            String dateT = dateTo.toString();
            String frmParts1 = dateFrom + " 00:00:00.0";
            String toParts1 = dateTo + " 00:00:00.0";
            String[] frmParts2 = dateFrm.split("-");
            String[] toParts2 = dateT.split("-");

            List<Leaves> finalLeaveList = new ArrayList<>();

            //if(dateFrm.length() > 0 && dateT.length() > 0){
                for(int i=0; i<leavesList1.size(); i++){
                    Leaves leaves = leavesList1.get(i);

                    String levDatFrm = leaves.getLeaveApplyFrom().toString();
                    String levDatTo = leaves.getLeaveApplyTo().toString();
                    String[] levfrmParts1 = levDatFrm.split(" ");
                    String[] levtoParts1 = levDatTo.split(" ");
                    String[] levfrmParts2 = levfrmParts1[0].toString().split("-");
                    String[] levtoParts2 = levtoParts1[0].toString().split("-");

                    if(Integer.parseInt(levfrmParts2[0]) >= Integer.parseInt(frmParts2[0]) && Integer.parseInt(levtoParts2[0]) <= Integer.parseInt(toParts2[0])){
                        if(Integer.parseInt(levfrmParts2[1]) >= Integer.parseInt(frmParts2[1]) && Integer.parseInt(levtoParts2[1]) <= Integer.parseInt(toParts2[1])){
                            if(Integer.parseInt(levfrmParts2[2]) >= Integer.parseInt(frmParts2[2]) && Integer.parseInt(levtoParts2[2]) <= Integer.parseInt(toParts2[2])){
                                finalLeaveList.add(leaves);
                            }
                        }
                    }
                }
            //}

            List<String> ids = new ArrayList<>();
            for(int i=0; i<finalLeaveList.size(); i++){
                ids.add(finalLeaveList.get(i).getUserId());
            }

//        Select specific hr record from same userId after filter leaves
            List<HRRecord> hrRecordList3 = new ArrayList<>();
            for(int i=0; i<ids.size()-1; i++){
                for(int j=0; j<=hrRecordList2.size()-1; j++){
                    if(ids.get(i).equalsIgnoreCase(hrRecordList2.get(j).getUserId())){
//                        System.out.println(userId.get(i) + " " + hrUserId.get(j));
                        String id = hrUserId.get(j);
                        hrRecordList3.add(hrRecordList2.get(j));
                    }
                }
            }


//            For date trying


            model.addAttribute("hrRecordList", hrRecordList3);
        }

//        for(int i=0; i<userIdList.size()-1; i++){
////            model.addAttribute("hrRecordList", hrRecordService.getAllRecord(userIdList.get(i)));
//            hrRecordList = hrRecordService.getAllRecord(userIdList.get(i));
//        }

//        model.addAttribute("hrRecordList", hrRecordService.getAllRecordByDept(department));
        return "leaves-report-consolidated";
    }
}
