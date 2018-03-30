package com.frsummit.HRM.controller.admin.profile;

import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UserRegistration {

    @Autowired
    private UserService userService;

    @Autowired
    private HRRecordService hrRecordService;

    //@RequestMapping(value="/admin/registration", method = RequestMethod.GET)
    @RequestMapping(value="/admin/profile-user-registration", method = RequestMethod.GET)
    public ModelAndView registration(){
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("profile_user_registration");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid User user, @RequestParam(value = "rl") String rl, BindingResult bindingResult, Model model) {

        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("profile_user_registration");
        }
        if(user.getEmail().equalsIgnoreCase(null)){
            modelAndView.addObject("emailError", "Email should be null or contain @ in between two character");
            modelAndView.setViewName("profile_user_registration");
        }
        if(user.getPassword().length()<5){
            modelAndView.addObject("passwordError", "Password must have at least 5 characters");
            modelAndView.setViewName("profile_user_registration");
        }
        else {
            if(rl == "") rl = "USER";
            String userRole = rl.toUpperCase();
            userService.saveUser(user, userRole);
            HRRecord hrRecord = new HRRecord(user.getId(),30,0,30,
                    5,5,5,5,5, 5,
                    0,0,0,0, 0,0,
                    5,5,5, 5,5,5);
            hrRecordService.saveHRRecord(hrRecord);
            System.out.println(user.getPassword());
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("profile_user_list");
        }
        model.addAttribute(userService.findAllUsers());
        return modelAndView;
    }


    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "profile_user_registration";
    }
}
