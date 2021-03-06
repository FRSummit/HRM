package com.frsummit.HRM.controller.admin.attendance;

import com.frsummit.HRM.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AttExternalLink {

    @Autowired
    private LinkService linkService;

    @RequestMapping(value = "/admin/attendance-admin-external-link", method = RequestMethod.GET)
    public String getExtLink(HttpServletRequest request){
        String url = request.getScheme() + linkService.findAllLinks().get(0).getUrl().toString();
        String redirectUrl = request.getScheme() + "://" + url;

        return "redirect:" + redirectUrl;
    }
}
