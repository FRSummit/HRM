package com.frsummit.HRM.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "payroll")
public class Payroll implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "user_id", nullable = false)
    @NotEmpty(message = "*Set user id")
    private String userId;

    ///////////////////////////////////////////////////
    ////////////// Total EARNINGS : 18 ////////////////
    ///////////////////////////////////////////////////
    @Column(name = "basic", nullable = false)
    @NotEmpty(message = "*Set user basic salary")
    private double basic;

    //Extra features
    @Column(name = "stipen")
    private double stipen;

    @Column(name = "house", nullable = false)
    private double houseRent;

    @Column(name = "conveyance", nullable = false)
    private double conveyance;

    @Column(name = "medical", nullable = false)
    private double medical;

    @Column(name = "adv_loan", nullable = false)
    private double advanceOrLoan;

    //Extra features
    @Column(name = "interesr")
    private double interest;

    //Extra features
    @Column(name = "other")
    private double otherAll;

    //Extra features
    @Column(name = "edu_all")
    private double educationalAll;

    @Column(name = "bonus")
    private double bonus;

    //Extra features
    @Column(name = "incentive")
    private double incentiveOrCommission;

    //Extra features
    @Column(name = "leave_encash")
    private double leaveEncashment;

    //Extra features
    @Column(name = "perquisite")
    private double perquisite;

    //Extra features
    @Column(name = "reimbursement")
    private double reimbursement;

    //Extra features
    @Column(name = "special")
    private double special;

    //Extra features
    @Column(name = "overtime")
    private double overtime;

    //Extra features
    @Column(name = "arrears")
    private double arrears;

    //Extra features
    @Column(name = "child")
    private double childFund;

    ///////////////////////////////////////////////////
    /////////////// Total DEDUCTIONS : 8 //////////////
    ///////////////////////////////////////////////////
    //Extra features
    @Column(name = "tds")
    private double tds;

    //Extra features
    @Column(name = "interest_ded")
    private double interestDED;

    @Column(name = "pf")
    private double pf;

    //Extra features
    @Column(name = "professional_tax_ded")
    private double professionalTaxDED;

    //Extra features
    @Column(name = "adv_loan_ded")
    private double advanceOrLoanDED;

    //Extra features
    @Column(name = "other_ded")
    private double otherDED;

    //Extra features
    @Column(name = "leave_ded")
    private double leaveDED;

    //Extra features
    @Column(name = "security_deposite_ded")
    private double securityDepositeDED;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "payroll_user", joinColumns = @JoinColumn(name = "pay_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private Set<User> user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public double getBasic() {
        return basic;
    }

    public void setBasic(double basic) {
        this.basic = basic;
    }

    public double getStipen() {
        return stipen;
    }

    public void setStipen(double stipen) {
        this.stipen = stipen;
    }

    public double getHouseRent() {
        return houseRent;
    }

    public void setHouseRent(double houseRent) {
        this.houseRent = houseRent;
    }

    public double getConveyance() {
        return conveyance;
    }

    public void setConveyance(double conveyance) {
        this.conveyance = conveyance;
    }

    public double getMedical() {
        return medical;
    }

    public void setMedical(double medical) {
        this.medical = medical;
    }

    public double getAdvanceOrLoan() {
        return advanceOrLoan;
    }

    public void setAdvanceOrLoan(double advanceOrLoan) {
        this.advanceOrLoan = advanceOrLoan;
    }

    public double getInterest() {
        return interest;
    }

    public void setInterest(double interest) {
        this.interest = interest;
    }

    public double getOtherAll() {
        return otherAll;
    }

    public void setOtherAll(double otherAll) {
        this.otherAll = otherAll;
    }

    public double getEducationalAll() {
        return educationalAll;
    }

    public void setEducationalAll(double educationalAll) {
        this.educationalAll = educationalAll;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getIncentiveOrCommission() {
        return incentiveOrCommission;
    }

    public void setIncentiveOrCommission(double incentiveOrCommission) {
        this.incentiveOrCommission = incentiveOrCommission;
    }

    public double getLeaveEncashment() {
        return leaveEncashment;
    }

    public void setLeaveEncashment(double leaveEncashment) {
        this.leaveEncashment = leaveEncashment;
    }

    public double getPerquisite() {
        return perquisite;
    }

    public void setPerquisite(double perquisite) {
        this.perquisite = perquisite;
    }

    public double getReimbursement() {
        return reimbursement;
    }

    public void setReimbursement(double reimbursement) {
        this.reimbursement = reimbursement;
    }

    public double getSpecial() {
        return special;
    }

    public void setSpecial(double special) {
        this.special = special;
    }

    public double getOvertime() {
        return overtime;
    }

    public void setOvertime(double overtime) {
        this.overtime = overtime;
    }

    public double getArrears() {
        return arrears;
    }

    public void setArrears(double arrears) {
        this.arrears = arrears;
    }

    public double getChildFund() {
        return childFund;
    }

    public void setChildFund(double childFund) {
        this.childFund = childFund;
    }

    public double getTds() {
        return tds;
    }

    public void setTds(double tds) {
        this.tds = tds;
    }

    public double getInterestDED() {
        return interestDED;
    }

    public void setInterestDED(double interestDED) {
        this.interestDED = interestDED;
    }

    public double getPf() {
        return pf;
    }

    public void setPf(double pf) {
        this.pf = pf;
    }

    public double getProfessionalTaxDED() {
        return professionalTaxDED;
    }

    public void setProfessionalTaxDED(double professionalTaxDED) {
        this.professionalTaxDED = professionalTaxDED;
    }

    public double getAdvanceOrLoanDED() {
        return advanceOrLoanDED;
    }

    public void setAdvanceOrLoanDED(double advanceOrLoanDED) {
        this.advanceOrLoanDED = advanceOrLoanDED;
    }

    public double getOtherDED() {
        return otherDED;
    }

    public void setOtherDED(double otherDED) {
        this.otherDED = otherDED;
    }

    public double getLeaveDED() {
        return leaveDED;
    }

    public void setLeaveDED(double leaveDED) {
        this.leaveDED = leaveDED;
    }

    public double getSecurityDepositeDED() {
        return securityDepositeDED;
    }

    public void setSecurityDepositeDED(double securityDepositeDED) {
        this.securityDepositeDED = securityDepositeDED;
    }
}
