package com.frsummit.HRM.controller.user.profile;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.configuration.ProfileSettings;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class ProfileEdit {

    @Autowired
    private UserService userService;

    @Autowired
    private MyAuthorization myAuthorization;

    @Autowired
    private ProfileSettings profileSettings;

    @RequestMapping(value="/user/profile-edit", method = RequestMethod.GET)
    public String profileEdit(Model model){
        model.addAttribute("myRole", myAuthorization.userFromEmailOrId().getMyRole());
        model.addAttribute("myId", myAuthorization.userFromEmailOrId().getId());
        return "profile_edit";
    }

    @RequestMapping(value = "/user/profile-update", method = RequestMethod.GET)
    public ModelAndView editUser(
            @RequestParam(value = "firstName") String fn,
            @RequestParam(value = "middleName") String mn,
            @RequestParam(value = "lastName") String ln,
            @RequestParam(value = "email") String email,
            @RequestParam(value = "department") String dept,
            @RequestParam(value = "designation") String desg,
            @RequestParam(value = "dob") String dob,
            @RequestParam(value = "sex") String sex,
            @RequestParam(value = "phone") String phone,
            @RequestParam(value = "bloodGroup") String bg,
            @RequestParam(value = "fatherName") String father,
            @RequestParam(value = "motherName") String mother,
            @RequestParam(value = "nid") String nid,
            @RequestParam(value = "passport") String passport,
            @RequestParam(value = "present_house") String pr_h,
            @RequestParam(value = "present_street") String pr_st,
            @RequestParam(value = "present_post_office") String pr_po,
            @RequestParam(value = "present_city") String pr_city,
            @RequestParam(value = "present_district") String pr_dis,
            @RequestParam(value = "present_country") String pr_cntry,
            @RequestParam(value = "permanent_house") String p_h,
            @RequestParam(value = "permanent_street") String p_st,
            @RequestParam(value = "permanent_post_office") String p_po,
            @RequestParam(value = "permanent_city") String p_city,
            @RequestParam(value = "permanent_district") String p_dis,
            @RequestParam(value = "permanent_country") String p_cntry){
//            @Valid User user, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        //userService.update(user);

//        User user = new User();
//        profileSettings.getOriginalName(fn, mn, ln, email, dept, desg, dob, sex, phone, bg, father, mother, nid, passport,
//                pr_h, pr_st, pr_po, pr_city, pr_dis, pr_cntry, p_h, p_st, p_po, p_city, p_dis, p_cntry);
        profileSettings.getOriginalName(fn, mn, ln, email, dept, desg, dob, sex, phone, bg, father, mother, nid, passport);

//        userService.updateUser(fn, mn, ln, email, dept, desg, dob, sex, phone, bg, father, mother, nid, passport);
//                pr_h, pr_st, pr_po, pr_city, pr_dis, pr_cntry, p_h, p_st, p_po, p_city, p_dis, p_cntry);


//        System.out.println(fn + " " +  mn + " " + ln + " " + email + " " + dept + " " +
//                desg + " " + dob + " " + sex + " " + phone + " " + bg + " " + father + " " + mother + " " + nid + " " + passport);

//        if(email.equalsIgnoreCase("")){
//            email = myAuthorization.userFromEmailOrId().getEmail();
//        }
//        System.out.println(email);

        modelAndView.setViewName("home");
        return modelAndView;
    }

}
