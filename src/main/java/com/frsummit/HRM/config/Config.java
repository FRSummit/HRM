package com.frsummit.HRM.config;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "config")
public class Config implements Serializable {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String profile_dob;
    private String profile_sex;
    private String profile_blood;
    private String profile_nid;
    private String profile_passport;
    private String profile_fatherName;
    private String profile_motherName;

    private String leave_employeeDetail;
    private String leave_personal;
    private String leave_sick;
    private String leave_planned;
    private String leave_vacation;
    private String leave_Maternity;
    private String leave_other;
    private String leave_name;
    private String leave_address;
    private String leave_phone;

    private String payroll_earning_educational;
    private String payroll_earning_bonus;
    private String payroll_earning_incentive;
    private String payroll_earning_leaveEncasement;
    private String payroll_earning_perquisite;
    private String payroll_earning_reimbursement;
    private String payroll_earning_special;
    private String payroll_earning_overtime;
    private String payroll_earning_arrears;
    private String payroll_earning_childFund;
    private String payroll_earning_stipen;
    private String payroll_deduction_tds;
    private String payroll_deduction_interest;
    private String payroll_deduction_pf;
    private String payroll_deduction_professionalTex;
    private String payroll_deduction_advancedOrLoan;
    private String payroll_deduction_other;
    private String payroll_deduction_leave;
    private String payroll_deduction_securityDeposite;

    public Config() {
    }

    public Config(String profile_dob, String profile_sex, String profile_blood, String profile_nid, String profile_passport, String profile_fatherName, String profile_motherName) {
        this.profile_dob = profile_dob;
        this.profile_sex = profile_sex;
        this.profile_blood = profile_blood;
        this.profile_nid = profile_nid;
        this.profile_passport = profile_passport;
        this.profile_fatherName = profile_fatherName;
        this.profile_motherName = profile_motherName;
    }

    public Config(String leave_employeeDetail, String leave_personal, String leave_sick, String leave_planned, String leave_vacation, String leave_Maternity, String leave_other, String leave_name, String leave_address, String leave_phone) {
        this.leave_employeeDetail = leave_employeeDetail;
        this.leave_personal = leave_personal;
        this.leave_sick = leave_sick;
        this.leave_planned = leave_planned;
        this.leave_vacation = leave_vacation;
        this.leave_Maternity = leave_Maternity;
        this.leave_other = leave_other;
        this.leave_name = leave_name;
        this.leave_address = leave_address;
        this.leave_phone = leave_phone;
    }

    public Config(String payroll_earning_educational, String payroll_earning_bonus, String payroll_earning_incentive, String payroll_earning_leaveEncasement, String payroll_earning_perquisite, String payroll_earning_reimbursement, String payroll_earning_special, String payroll_earning_overtime, String payroll_earning_arrears, String payroll_earning_childFund, String payroll_earning_stipen) {
        this.payroll_earning_educational = payroll_earning_educational;
        this.payroll_earning_bonus = payroll_earning_bonus;
        this.payroll_earning_incentive = payroll_earning_incentive;
        this.payroll_earning_leaveEncasement = payroll_earning_leaveEncasement;
        this.payroll_earning_perquisite = payroll_earning_perquisite;
        this.payroll_earning_reimbursement = payroll_earning_reimbursement;
        this.payroll_earning_special = payroll_earning_special;
        this.payroll_earning_overtime = payroll_earning_overtime;
        this.payroll_earning_arrears = payroll_earning_arrears;
        this.payroll_earning_childFund = payroll_earning_childFund;
        this.payroll_earning_stipen = payroll_earning_stipen;
    }

    public Config(String payroll_deduction_tds, String payroll_deduction_interest, String payroll_deduction_pf, String payroll_deduction_professionalTex, String payroll_deduction_advancedOrLoan, String payroll_deduction_other, String payroll_deduction_leave, String payroll_deduction_securityDeposite) {
        this.payroll_deduction_tds = payroll_deduction_tds;
        this.payroll_deduction_interest = payroll_deduction_interest;
        this.payroll_deduction_pf = payroll_deduction_pf;
        this.payroll_deduction_professionalTex = payroll_deduction_professionalTex;
        this.payroll_deduction_advancedOrLoan = payroll_deduction_advancedOrLoan;
        this.payroll_deduction_other = payroll_deduction_other;
        this.payroll_deduction_leave = payroll_deduction_leave;
        this.payroll_deduction_securityDeposite = payroll_deduction_securityDeposite;
    }

    public String getProfile_dob() {
        return profile_dob;
    }

    public void setProfile_dob(String profile_dob) {
        this.profile_dob = profile_dob;
    }

    public String getProfile_sex() {
        return profile_sex;
    }

    public void setProfile_sex(String profile_sex) {
        this.profile_sex = profile_sex;
    }

    public String getProfile_blood() {
        return profile_blood;
    }

    public void setProfile_blood(String profile_blood) {
        this.profile_blood = profile_blood;
    }

    public String getProfile_nid() {
        return profile_nid;
    }

    public void setProfile_nid(String profile_nid) {
        this.profile_nid = profile_nid;
    }

    public String getProfile_passport() {
        return profile_passport;
    }

    public void setProfile_passport(String profile_passport) {
        this.profile_passport = profile_passport;
    }

    public String getProfile_fatherName() {
        return profile_fatherName;
    }

    public void setProfile_fatherName(String profile_fatherName) {
        this.profile_fatherName = profile_fatherName;
    }

    public String getProfile_motherName() {
        return profile_motherName;
    }

    public void setProfile_motherName(String profile_motherName) {
        this.profile_motherName = profile_motherName;
    }

    public String getLeave_employeeDetail() {
        return leave_employeeDetail;
    }

    public void setLeave_employeeDetail(String leave_employeeDetail) {
        this.leave_employeeDetail = leave_employeeDetail;
    }

    public String getLeave_personal() {
        return leave_personal;
    }

    public void setLeave_personal(String leave_personal) {
        this.leave_personal = leave_personal;
    }

    public String getLeave_sick() {
        return leave_sick;
    }

    public void setLeave_sick(String leave_sick) {
        this.leave_sick = leave_sick;
    }

    public String getLeave_planned() {
        return leave_planned;
    }

    public void setLeave_planned(String leave_planned) {
        this.leave_planned = leave_planned;
    }

    public String getLeave_vacation() {
        return leave_vacation;
    }

    public void setLeave_vacation(String leave_vacation) {
        this.leave_vacation = leave_vacation;
    }

    public String getLeave_Maternity() {
        return leave_Maternity;
    }

    public void setLeave_Maternity(String leave_Maternity) {
        this.leave_Maternity = leave_Maternity;
    }

    public String getLeave_other() {
        return leave_other;
    }

    public void setLeave_other(String leave_other) {
        this.leave_other = leave_other;
    }

    public String getLeave_name() {
        return leave_name;
    }

    public void setLeave_name(String leave_name) {
        this.leave_name = leave_name;
    }

    public String getLeave_address() {
        return leave_address;
    }

    public void setLeave_address(String leave_address) {
        this.leave_address = leave_address;
    }

    public String getLeave_phone() {
        return leave_phone;
    }

    public void setLeave_phone(String leave_phone) {
        this.leave_phone = leave_phone;
    }

    public String getPayroll_earning_educational() {
        return payroll_earning_educational;
    }

    public void setPayroll_earning_educational(String payroll_earning_educational) {
        this.payroll_earning_educational = payroll_earning_educational;
    }

    public String getPayroll_earning_bonus() {
        return payroll_earning_bonus;
    }

    public void setPayroll_earning_bonus(String payroll_earning_bonus) {
        this.payroll_earning_bonus = payroll_earning_bonus;
    }

    public String getPayroll_earning_incentive() {
        return payroll_earning_incentive;
    }

    public void setPayroll_earning_incentive(String payroll_earning_incentive) {
        this.payroll_earning_incentive = payroll_earning_incentive;
    }

    public String getPayroll_earning_leaveEncasement() {
        return payroll_earning_leaveEncasement;
    }

    public void setPayroll_earning_leaveEncasement(String payroll_earning_leaveEncasement) {
        this.payroll_earning_leaveEncasement = payroll_earning_leaveEncasement;
    }

    public String getPayroll_earning_perquisite() {
        return payroll_earning_perquisite;
    }

    public void setPayroll_earning_perquisite(String payroll_earning_perquisite) {
        this.payroll_earning_perquisite = payroll_earning_perquisite;
    }

    public String getPayroll_earning_reimbursement() {
        return payroll_earning_reimbursement;
    }

    public void setPayroll_earning_reimbursement(String payroll_earning_reimbursement) {
        this.payroll_earning_reimbursement = payroll_earning_reimbursement;
    }

    public String getPayroll_earning_special() {
        return payroll_earning_special;
    }

    public void setPayroll_earning_special(String payroll_earning_special) {
        this.payroll_earning_special = payroll_earning_special;
    }

    public String getPayroll_earning_overtime() {
        return payroll_earning_overtime;
    }

    public void setPayroll_earning_overtime(String payroll_earning_overtime) {
        this.payroll_earning_overtime = payroll_earning_overtime;
    }

    public String getPayroll_earning_arrears() {
        return payroll_earning_arrears;
    }

    public void setPayroll_earning_arrears(String payroll_earning_arrears) {
        this.payroll_earning_arrears = payroll_earning_arrears;
    }

    public String getPayroll_earning_childFund() {
        return payroll_earning_childFund;
    }

    public void setPayroll_earning_childFund(String payroll_earning_childFund) {
        this.payroll_earning_childFund = payroll_earning_childFund;
    }

    public String getPayroll_earning_stipen() {
        return payroll_earning_stipen;
    }

    public void setPayroll_earning_stipen(String payroll_earning_stipen) {
        this.payroll_earning_stipen = payroll_earning_stipen;
    }

    public String getPayroll_deduction_tds() {
        return payroll_deduction_tds;
    }

    public void setPayroll_deduction_tds(String payroll_deduction_tds) {
        this.payroll_deduction_tds = payroll_deduction_tds;
    }

    public String getPayroll_deduction_interest() {
        return payroll_deduction_interest;
    }

    public void setPayroll_deduction_interest(String payroll_deduction_interest) {
        this.payroll_deduction_interest = payroll_deduction_interest;
    }

    public String getPayroll_deduction_pf() {
        return payroll_deduction_pf;
    }

    public void setPayroll_deduction_pf(String payroll_deduction_pf) {
        this.payroll_deduction_pf = payroll_deduction_pf;
    }

    public String getPayroll_deduction_professionalTex() {
        return payroll_deduction_professionalTex;
    }

    public void setPayroll_deduction_professionalTex(String payroll_deduction_professionalTex) {
        this.payroll_deduction_professionalTex = payroll_deduction_professionalTex;
    }

    public String getPayroll_deduction_advancedOrLoan() {
        return payroll_deduction_advancedOrLoan;
    }

    public void setPayroll_deduction_advancedOrLoan(String payroll_deduction_advancedOrLoan) {
        this.payroll_deduction_advancedOrLoan = payroll_deduction_advancedOrLoan;
    }

    public String getPayroll_deduction_other() {
        return payroll_deduction_other;
    }

    public void setPayroll_deduction_other(String payroll_deduction_other) {
        this.payroll_deduction_other = payroll_deduction_other;
    }

    public String getPayroll_deduction_leave() {
        return payroll_deduction_leave;
    }

    public void setPayroll_deduction_leave(String payroll_deduction_leave) {
        this.payroll_deduction_leave = payroll_deduction_leave;
    }

    public String getPayroll_deduction_securityDeposite() {
        return payroll_deduction_securityDeposite;
    }

    public void setPayroll_deduction_securityDeposite(String payroll_deduction_securityDeposite) {
        this.payroll_deduction_securityDeposite = payroll_deduction_securityDeposite;
    }
}
