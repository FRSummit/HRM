package com.frsummit.HRM.controller;

import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.service.RoleService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    private static String OS = System.getProperty("os.name").toLowerCase();

    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(){

        Role role = new Role(1, "ADMIN", "ADMIN");
        roleService.insertRoleAdmin(role);
        userService.createAdmin();
        userService.updateAdmin();

        System.out.println(OS);

        if (isWindows()) {
            System.out.println("This is Windows");
        } else if (isMac()) {
            System.out.println("This is Mac");
        } else if (isUnix()) {
            System.out.println("This is Unix or Linux");
        } else if (isSolaris()) {
            System.out.println("This is Solaris");
        } else {
            System.out.println("Your OS is not support!!");
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    public static boolean isWindows() {
        return (OS.indexOf("win") >= 0);
    }

    public static boolean isMac() {
        return (OS.indexOf("mac") >= 0);
    }

    public static boolean isUnix() {
        return (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0 || OS.indexOf("aix") > 0 );
    }

    public static boolean isSolaris() {
        return (OS.indexOf("sunos") >= 0);
    }


//    URL Call
    /*@RequestMapping(method = RequestMethod.POST)
    public String processForm(HttpServletRequest request, LoginForm loginForm,
                              BindingResult result, ModelMap model)
    {
        String redirectUrl = request.getScheme() + "://www.yahoo.com";
        return "redirect:" + redirectUrl;
    }*/
}


/*
    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public String login(HttpServletRequest request){

        String redirectUrl = request.getScheme() + "://www.yahoo.com";
        return "redirect:" + redirectUrl;
    }
 */