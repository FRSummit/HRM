package com.frsummit.HRM.controller;

import com.frsummit.HRM.config.Config;
import com.frsummit.HRM.config.ConfigServe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConfigTest {

    @Autowired
    private ConfigServe configServe;

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


    @RequestMapping(value = "/admin/configuration-test", method = RequestMethod.GET)
    public String configurationTest(
            @RequestParam(value = "check") String check6) {

        //System.out.println(check1 + " " + check2 + " " + check3 + " " + check4 + " " + check5 + " " + check6);
        conf(check6);
        return "home";
    }

    public void conf(String str){
//        String[] profile = {"dob", "gender", "blood", "nid", "passport", "father", "mother"};
//        String[] leaves = {"empDetails", "personal", "sick", "planned", "vacation", "maternity", "other"};
//        String[] emergencyContact = {"name", "address", "phone"};
//        String[] earnings = {"educational", "bonus", "incentive", "leaveEncasement",
//                "perquisite", "reimbursement", "special", "overtime", "arrears", "childFund", "stipen"};

        String dob, gender, blood, nid, passport, father, mother;
        String empDetails, personal, sick, planned, vacation, maternity, other, name, address, phone;
        String educational, bonus, incentive, leaveEncasement, perquisite, reimbursement, special, overtime, arrears, childFund, stipen;
        String tds, interest, pf, professionalTex, advancedOrLoan, otherDed, leaveDed, securityDeposit;

        String[] myName = {"dbo", "gender", "blood", "nid", "father", "passport", "mother",
                "empDetails", "personal", "sick", "planned", "vacation", "maternity", "other",
                "name", "address", "phone",
                "educational", "bonus", "incentive", "leaveEncasement", "perquisite", "reimbursement", "special",
                "overtime", "arrears", "childFund", "stipen",
                "tds", "interest", "pf", "professionalTex", "advancedOrLoan", "otherDed", "leave", "securityDeposit"};

        String[] fromPage = {"Date of Birth", "Gender", "Blood Group", "NID", "Father Name", "Passport No", "Mother Name",
                "Employee Details", "Personal Leave Records", "Sick Leave Records", "Planned Leave Records",
                "Vacation Leave Records", "Maternity Leave Records", "Other Records",
                "Name", "Address", "Phone",
                "Educational", "Bonus", "Incentive", "Leave Encasement", "Perquisite", "Reimbursement", "Special",
                "Overtime", "Arrears", "Child Fund", "Stipen",
                "TDS", "Interest", "PF", "Professional Tex", "Advanced/Loan", "OtherDed", "Leave", "Security Deposit"};

        String[] parts = str.split(",");
//        String[] generatedParts= {};
        for(int i=0; i<parts.length; i++){
            for(int j=0; j<fromPage.length; j++){
                if(parts[i].equalsIgnoreCase(fromPage[j])){
//                    System.out.println(parts[i] + " " + fromPage[j]);
                    System.out.print(myName[j] + " ");
                    myName[j]=parts[i].toUpperCase();
                    System.out.println(myName[j]);
                }
            }
        }

        Config configProfile = new Config(myName[0], myName[1], myName[2], myName[3], myName[4], myName[5], myName[6]);
        Config configLeave = new Config(myName[7], myName[8], myName[9], myName[10], myName[11], myName[12], myName[13], myName[14], myName[15], myName[16]);
        Config configTotalEar = new Config(myName[17], myName[18], myName[19], myName[20], myName[21], myName[22], myName[23], myName[24], myName[25], myName[26], myName[27]);
        Config configTotalDed = new Config(myName[28], myName[29], myName[30], myName[31], myName[32], myName[33], myName[34], myName[35]);

        Config config = new Config(myName[0], myName[1], myName[2], myName[3], myName[4], myName[5], myName[6],
                myName[7], myName[8], myName[9], myName[10], myName[11], myName[12], myName[13], myName[14],
                myName[15], myName[16],
                myName[17], myName[18], myName[19], myName[20], myName[21], myName[22], myName[23], myName[24],
                myName[25], myName[26], myName[27],
                myName[28], myName[29], myName[30], myName[31], myName[32], myName[33], myName[34], myName[35]);

//        configServe.saveProfileConfig(configProfile);
//        configServe.saveLeaveConfig(configLeave);
//        configServe.savePayrollEarningConfig(configTotalEar);
//        configServe.savePayrollDeductionConfig(configTotalDed);

        configServe.saveConf(config);

//        Config config = new Config(parts);
//        configServe.saveConf(config);

//        for(int i=0; i<parts.length; i++){
//            if(parts[i].equalsIgnoreCase(fromPage[i])){
//                myName[i]=parts[i];
//            }
//            System.out.println(myName[i]);
//        }


    }
}
