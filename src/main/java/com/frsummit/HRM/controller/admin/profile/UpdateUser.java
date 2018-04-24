package com.frsummit.HRM.controller.admin.profile;

import com.frsummit.HRM.config.ConfigAuth;
import com.frsummit.HRM.config.ConfigServe;
import com.frsummit.HRM.model.User;
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
public class UpdateUser {

    @Autowired
    private UserService userService;

    @Autowired
    private ConfigAuth configAuth;

    @RequestMapping(value = "/admin/profile-user-update", method = RequestMethod.GET)
    public String updateUser(Model model){
        model.addAttribute("myConfigDob", configAuth.configName().getProfile_dob());
        model.addAttribute("myConfigSex", configAuth.configName().getProfile_sex());
        model.addAttribute("myConfigBlood", configAuth.configName().getProfile_blood());
        model.addAttribute("myConfigFather", configAuth.configName().getProfile_fatherName());
        model.addAttribute("myConfigMother", configAuth.configName().getProfile_motherName());
        model.addAttribute("myConfigNid", configAuth.configName().getProfile_nid());
        model.addAttribute("myConfigPassport", configAuth.configName().getProfile_passport());
        System.out.println(configAuth.configName().getProfile_passport());
        return "profile_user_update";
    }

    @RequestMapping(value = "/admin/profile-update", method = RequestMethod.GET)
    public ModelAndView updateUser(@Valid User user, BindingResult bindingResult, Model model,
                                   @RequestParam(value = "firstName") String firstName,
                                   @RequestParam(value = "userRole") String userRole){
        ModelAndView modelAndView = new ModelAndView();
        userService.saveUser(user, userRole);
        System.out.println(firstName);
        modelAndView.setViewName("profile_user_list");
        return modelAndView;
    }
}
