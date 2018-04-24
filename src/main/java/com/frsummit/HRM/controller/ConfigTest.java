package com.frsummit.HRM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConfigTest {

    @RequestMapping(value = "/admin/config-test", method = RequestMethod.GET)
    public String configTest(
//            @RequestParam(value = "check1") String check1,
//            @RequestParam(value = "check2") String check2,
//            @RequestParam(value = "check3") String check3,
//            @RequestParam(value = "check4") String check4,
//            @RequestParam(value = "check5") String check5,
            @RequestParam(value = "check") String check6){

        //System.out.println(check1 + " " + check2 + " " + check3 + " " + check4 + " " + check5 + " " + check6);
        System.out.println(check6);
        String[] myParts = {"First", "Second", "Third", "Fourth", "Fifth", "Sixth"};
        String[] parts = check6.split(",");
        for(int i=0; i<parts.length; i++){
            for(int j=0; j<myParts.length; j++){
                if(parts[i].equalsIgnoreCase(myParts[j]))
                    System.out.println(parts[i] + " " + myParts[j]);
            }
        }
        return "home";
    }
}
