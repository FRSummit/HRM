package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.configuration.LeaveConfiguration;
import com.frsummit.HRM.model.*;
import com.frsummit.HRM.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

import java.sql.Date;
import java.util.List;

@Controller
public class LeaveApply {

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private HRRecordService hrRecordService;

    @Autowired
    private EmergencyContactService emergencyContactService;

    @RequestMapping(value = "/user/leave-user-apply", method = RequestMethod.GET)
    public String leaveApplicationForm(Model model){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;
        List<HRRecord> hrList = hrRecordService.getAllRecord(user.getId());
        HRRecord hrRecord = hrList.get(0);

//        Employee Details
        model.addAttribute("titleId", user.getId());
        String firstName = user.getFirstName();
        String middleName = user.getMiddleName();
        String lastName = user.getLastName();
        firstName = firstName != null ? firstName : "";
        middleName = middleName != null ? middleName : "";
        lastName = lastName != null ? lastName : "";
        model.addAttribute("titleFullName", firstName + " " + middleName + " " + lastName);
        model.addAttribute("titleDepartment", user.getDepartment());

//        HrRecords Info
        model.addAttribute("totalLeaves", hrRecord.getTotalLeave());
        model.addAttribute("balance", hrRecord.getLeaveBalance());
        model.addAttribute("taken", hrRecord.getTotalLeaveTaken());

        model.addAttribute("personal_total", hrRecord.getTotalLeavePersonal());
        model.addAttribute("personal_taken", hrRecord.getTotalLeaveTakenPersonal());
        model.addAttribute("personal_balance", hrRecord.getLeaveBalancePersonal());

        model.addAttribute("sick_total", hrRecord.getTotalLeaveSick());
        model.addAttribute("sick_taken", hrRecord.getTotalLeaveTakenSick());
        model.addAttribute("sick_balance", hrRecord.getLeaveBalanceSick());

        model.addAttribute("planned_total", hrRecord.getTotalLeavePlanned());
        model.addAttribute("planned_taken", hrRecord.getTotalLeaveTakenPlanned());
        model.addAttribute("planned_balance", hrRecord.getLeaveBalancePlanned());

        model.addAttribute("vacation_total", hrRecord.getTotalLeaveVacation());
        model.addAttribute("vacation_taken", hrRecord.getTotalLeaveTakenVacation());
        model.addAttribute("vacation_balance", hrRecord.getLeaveBalanceVacation());

        model.addAttribute("maternity_total", hrRecord.getTotalLeaveMaternity());
        model.addAttribute("maternity_taken", hrRecord.getTotalLeaveTakenMaternity());
        model.addAttribute("maternity_balance", hrRecord.getLeaveBalanceMaternity());

        model.addAttribute("other_total", hrRecord.getTotalLeaveOther());
        model.addAttribute("other_taken", hrRecord.getTotalLeaveTakenOther());
        model.addAttribute("other_balance", hrRecord.getLeaveBalanceOther());

        return "leaves_user_apply";
    }

    @RequestMapping(value = "/user/apply-for-leave", method = RequestMethod.POST)
    public ModelAndView applyForLeave(
            @RequestParam(value = "applyFrom") Date leaveApplyFrom,
            @RequestParam(value = "applyTo") Date leaveApplyTo,
            @RequestParam(value = "leaveType") String leaveType,
            @RequestParam(value = "leaveReason") String leaveReason,
            @RequestParam(value = "totalLeaveDays") int totalDayOfLeave,
            @RequestParam(value = "leaveDescription") String leaveDescription,
            @RequestParam(value = "emergencyContactName") String emergencyContactName,
            @RequestParam(value = "emergencyContactAddress") String emergencyContactAddress,
            @RequestParam(value = "emergencyContactPhone") String emergencyContactPhone){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;

        ModelAndView modelAndView = new ModelAndView();
        LeaveConfiguration leaveConfiguration = new LeaveConfiguration();
        List<Role> roleList = roleService.findAllRole(user.getMyRole());
        Role role = roleList.get(0);
        String applyToWhom = leaveConfiguration.mapForNextRole(role.getRole(), role.getRoleChain());

        Leaves leaves = new Leaves(user.getId(), leaveApplyFrom, leaveApplyTo, totalDayOfLeave, leaveDescription,
                leaveReason, leaveType, "Pending", applyToWhom,
                "New Apply", "New Apply");
        EmergencyContact emergencyContact = new EmergencyContact(user.getId() ,emergencyContactName, emergencyContactAddress, emergencyContactPhone);
        leaveService.saveLeave(leaves);
        emergencyContactService.saveEmergencyContact(emergencyContact);

        modelAndView.setViewName("leaves_user_history");
        return modelAndView;
    }
}
