package com.frsummit.HRM.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "hr_record")
public class HRRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "user_id", nullable = false)
    private String userId;

////  Total
    @Column(name = "total_leave", nullable = false)
    private int totalLeave;

    @Column(name = "total_leave_personal", nullable = false)
    private int totalLeavePersonal;

    @Column(name = "total_leave_sick", nullable = false)
    private int totalLeaveSick;

    @Column(name = "total_leave_planned", nullable = false)
    private int totalLeavePlanned;

    @Column(name = "total_leave_vacation", nullable = false)
    private int totalLeaveVacation;

    @Column(name = "total_leave_maternity", nullable = false)
    private int totalLeaveMaternity;

    @Column(name = "total_leave_other", nullable = false)
    private int totalLeaveOther;

////  Total Taken
    @Column(name = "taken", nullable = false)
    private int totalLeaveTaken;

    @Column(name = "taken_personal", nullable = false)
    private int totalLeaveTakenPersonal;

    @Column(name = "taken_sick", nullable = false)
    private int totalLeaveTakenSick;

    @Column(name = "taken_planned", nullable = false)
    private int totalLeaveTakenPlanned;

    @Column(name = "taken_vacation", nullable = false)
    private int totalLeaveTakenVacation;

    @Column(name = "taken_maternity", nullable = false)
    private int totalLeaveTakenMaternity;

    @Column(name = "taken_other", nullable = false)
    private int totalLeaveTakenOther;

////  Balance
    @Column(name = "balance", nullable = false)
    private int leaveBalance;

    @Column(name = "balance_personal", nullable = false)
    private int leaveBalancePersonal;

    @Column(name = "balance_sick", nullable = false)
    private int leaveBalanceSick;

    @Column(name = "balance_planned", nullable = false)
    private int leaveBalancePlanned;

    @Column(name = "balance_vacation", nullable = false)
    private int leaveBalanceVacation;

    @Column(name = "balance_maternity", nullable = false)
    private int leaveBalanceMaternity;

    @Column(name = "balance_other", nullable = false)
    private int leaveBalanceOther;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "hr_record_user", joinColumns = @JoinColumn(name = "hr_record_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private Set<User> hrRecordUser;

    public HRRecord() {
    }

    public HRRecord(String userId, int totalLeave, int totalLeaveTaken, int leaveBalance,
                    int totalLeavePersonal, int totalLeaveSick, int totalLeavePlanned, int totalLeaveVacation, int totalLeaveMaternity, int totalLeaveOther,
                    int totalLeaveTakenPersonal, int totalLeaveTakenSick, int totalLeaveTakenPlanned, int totalLeaveTakenVacation, int totalLeaveTakenMaternity, int totalLeaveTakenOther,
                    int leaveBalancePersonal, int leaveBalanceSick, int leaveBalancePlanned, int leaveBalanceVacation, int leaveBalanceMaternity, int leaveBalanceOther) {

        this.userId = userId;
        this.totalLeave = totalLeave;
        this.totalLeaveTaken = totalLeaveTaken;
        this.leaveBalance = leaveBalance;

        this.totalLeavePersonal = totalLeavePersonal;
        this.totalLeaveSick = totalLeaveSick;
        this.totalLeavePlanned = totalLeavePlanned;
        this.totalLeaveVacation = totalLeaveVacation;
        this.totalLeaveMaternity = totalLeaveMaternity;
        this.totalLeaveOther = totalLeaveOther;

        this.totalLeaveTakenPersonal = totalLeaveTakenPersonal;
        this.totalLeaveTakenSick = totalLeaveTakenSick;
        this.totalLeaveTakenPlanned = totalLeaveTakenPlanned;
        this.totalLeaveTakenVacation = totalLeaveTakenVacation;
        this.totalLeaveTakenMaternity = totalLeaveTakenMaternity;
        this.totalLeaveTakenOther = totalLeaveTakenOther;

        this.leaveBalancePersonal = leaveBalancePersonal;
        this.leaveBalanceSick = leaveBalanceSick;
        this.leaveBalancePlanned = leaveBalancePlanned;
        this.leaveBalanceVacation = leaveBalanceVacation;
        this.leaveBalanceMaternity = leaveBalanceMaternity;
        this.leaveBalanceOther = leaveBalanceOther;
    }

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

    public int getTotalLeave() {
        return totalLeave;
    }

    public void setTotalLeave(int totalLeave) {
        this.totalLeave = totalLeave;
    }

    public int getTotalLeavePersonal() {
        return totalLeavePersonal;
    }

    public void setTotalLeavePersonal(int totalLeavePersonal) {
        this.totalLeavePersonal = totalLeavePersonal;
    }

    public int getTotalLeaveSick() {
        return totalLeaveSick;
    }

    public void setTotalLeaveSick(int totalLeaveSick) {
        this.totalLeaveSick = totalLeaveSick;
    }

    public int getTotalLeavePlanned() {
        return totalLeavePlanned;
    }

    public void setTotalLeavePlanned(int totalLeavePlanned) {
        this.totalLeavePlanned = totalLeavePlanned;
    }

    public int getTotalLeaveVacation() {
        return totalLeaveVacation;
    }

    public void setTotalLeaveVacation(int totalLeaveVacation) {
        this.totalLeaveVacation = totalLeaveVacation;
    }

    public int getTotalLeaveMaternity() {
        return totalLeaveMaternity;
    }

    public void setTotalLeaveMaternity(int totalLeaveMaternity) {
        this.totalLeaveMaternity = totalLeaveMaternity;
    }

    public int getTotalLeaveOther() {
        return totalLeaveOther;
    }

    public void setTotalLeaveOther(int totalLeaveOther) {
        this.totalLeaveOther = totalLeaveOther;
    }

    public int getTotalLeaveTaken() {
        return totalLeaveTaken;
    }

    public void setTotalLeaveTaken(int totalLeaveTaken) {
        this.totalLeaveTaken = totalLeaveTaken;
    }

    public int getTotalLeaveTakenPersonal() {
        return totalLeaveTakenPersonal;
    }

    public void setTotalLeaveTakenPersonal(int totalLeaveTakenPersonal) {
        this.totalLeaveTakenPersonal = totalLeaveTakenPersonal;
    }

    public int getTotalLeaveTakenSick() {
        return totalLeaveTakenSick;
    }

    public void setTotalLeaveTakenSick(int totalLeaveTakenSick) {
        this.totalLeaveTakenSick = totalLeaveTakenSick;
    }

    public int getTotalLeaveTakenPlanned() {
        return totalLeaveTakenPlanned;
    }

    public void setTotalLeaveTakenPlanned(int totalLeaveTakenPlanned) {
        this.totalLeaveTakenPlanned = totalLeaveTakenPlanned;
    }

    public int getTotalLeaveTakenVacation() {
        return totalLeaveTakenVacation;
    }

    public void setTotalLeaveTakenVacation(int totalLeaveTakenVacation) {
        this.totalLeaveTakenVacation = totalLeaveTakenVacation;
    }

    public int getTotalLeaveTakenMaternity() {
        return totalLeaveTakenMaternity;
    }

    public void setTotalLeaveTakenMaternity(int totalLeaveTakenMaternity) {
        this.totalLeaveTakenMaternity = totalLeaveTakenMaternity;
    }

    public int getTotalLeaveTakenOther() {
        return totalLeaveTakenOther;
    }

    public void setTotalLeaveTakenOther(int totalLeaveTakenOther) {
        this.totalLeaveTakenOther = totalLeaveTakenOther;
    }

    public int getLeaveBalance() {
        return leaveBalance;
    }

    public void setLeaveBalance(int leaveBalance) {
        this.leaveBalance = leaveBalance;
    }

    public int getLeaveBalancePersonal() {
        return leaveBalancePersonal;
    }

    public void setLeaveBalancePersonal(int leaveBalancePersonal) {
        this.leaveBalancePersonal = leaveBalancePersonal;
    }

    public int getLeaveBalanceSick() {
        return leaveBalanceSick;
    }

    public void setLeaveBalanceSick(int leaveBalanceSick) {
        this.leaveBalanceSick = leaveBalanceSick;
    }

    public int getLeaveBalancePlanned() {
        return leaveBalancePlanned;
    }

    public void setLeaveBalancePlanned(int leaveBalancePlanned) {
        this.leaveBalancePlanned = leaveBalancePlanned;
    }

    public int getLeaveBalanceVacation() {
        return leaveBalanceVacation;
    }

    public void setLeaveBalanceVacation(int leaveBalanceVacation) {
        this.leaveBalanceVacation = leaveBalanceVacation;
    }

    public int getLeaveBalanceMaternity() {
        return leaveBalanceMaternity;
    }

    public void setLeaveBalanceMaternity(int leaveBalanceMaternity) {
        this.leaveBalanceMaternity = leaveBalanceMaternity;
    }

    public int getLeaveBalanceOther() {
        return leaveBalanceOther;
    }

    public void setLeaveBalanceOther(int leaveBalanceOther) {
        this.leaveBalanceOther = leaveBalanceOther;
    }

    public Set<User> getHrRecordUser() {
        return hrRecordUser;
    }

    public void setHrRecordUser(Set<User> hrRecordUser) {
        this.hrRecordUser = hrRecordUser;
    }
}
