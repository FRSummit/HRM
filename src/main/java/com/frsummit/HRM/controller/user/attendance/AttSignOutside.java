package com.frsummit.HRM.controller.user.attendance;

import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AttSignOutside {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/attendInOutSign-outside", method = RequestMethod.GET)
    public String getAtt(@RequestParam(value = "username") String username){
        User user = userService.findUserById(username);
        System.out.println(user.getEmail());
        System.out.println("this is");

        return "zz_test_image";
    }
}
