package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.LeaveConfiguration;
import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.Message;
import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.MessageService;
import com.frsummit.HRM.service.RoleService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class RecentApplications {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private MyAuthorization myAuthorization;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/admin/leave-admin-recent", method = RequestMethod.GET)
    public String recentApplicationsLoad(Model model){

        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user1 = userService.findUserByEmail(auth.getName());
        User user2 = userService.findUserById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;*/

        //model.addAttribute("leavesList",leaveService.findAllLeavesByRole(user.getMyRole()));
        //model.addAttribute("leavesList",leaveService.findAllLeavesByRole(comService.getUserIdOrEmail().getMyRole()));
        model.addAttribute("leavesList",leaveService.findAllLeavesByRole(myAuthorization.userFromEmailOrId().getMyRole()));

        return "leaves_admin_recent";
    }

    @RequestMapping(value = "/admin/leave-status-update", method = RequestMethod.GET)
    public String leaveStatusUpdate(
            @RequestParam String leaveId,
            @RequestParam String selectStatus,
            @RequestParam String message,
            Model model){

        System.out.println(leaveId + " " + selectStatus + " " + message);

        String leaveActionBy = myAuthorization.userFromEmailOrId().getMyRole();
        String modifyTo;

        LeaveConfiguration leaveConfig = new LeaveConfiguration();
        List<Role> roleList = roleService.findAllRole(myAuthorization.userFromEmailOrId().getMyRole());
        Role role = roleList.get(0);
        modifyTo = leaveConfig.mapForNextRole(leaveActionBy, role.getRoleChain());

        if(!selectStatus.equalsIgnoreCase("Granted") || myAuthorization.userFromEmailOrId().getMyRole().equalsIgnoreCase("ADMIN")) modifyTo = "Modified";
        System.out.println("This is leave id : " + leaveId);

        if(selectStatus.equalsIgnoreCase("Checking")){
            Message m = new Message(leaveId, message, "UnCheck");
            System.out.println("This is message : " + m);
            messageService.saveMessage(m);
            leaveService.updateLeaveStatus(leaveId, selectStatus, leaveActionBy, myAuthorization.userFromEmailOrId().getMyRole());
        }
        else{
            leaveService.updateLeaveStatus(leaveId, selectStatus, leaveActionBy, modifyTo);
        }

        if(myAuthorization.userFromEmailOrId().getMyRole().equalsIgnoreCase("ADMIN"))
            model.addAttribute(leaveService.findAllLeaves());
        model.addAttribute(leaveService.findAllLeavesByRole(myAuthorization.userFromEmailOrId().getMyRole()));

        return "leaves_admin_recent";
    }
}
