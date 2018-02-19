package com.frsummit.HRM.model;

import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "leaves")
public class Leaves implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "user_id", nullable = false)
    @NotEmpty(message = "*Set user id")
    private String userId;

    @Column(name = "apply_date", nullable = false)
    @UpdateTimestamp
    private Date leaveApplyDate;

    @Column(name = "apply_from", nullable = false)
    private Date leaveApplyFrom;

    @Column(name = "apply_to", nullable = false)
    private Date leaveApplyTo;

    @Column(name = "total_leave_day")
    private int totalDayOfLeave;

    @Column(name = "reason")
    private String leaveReason;

    @Column(name = "type", nullable = false)
    private String leaveType;

    @Column(name = "description")
    private String leaveDescription;

    @Column(name = "status")
    private String leaveStatus;

    @Column(name = "apply_whom", nullable = false)
    private String applyWhom;

    @Column(name = "modify_to", nullable = false)
    private String modifyToWhom;

    @Column(name = "action_by", nullable = false)
    private String leaveActionBy;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "leave_user", joinColumns = @JoinColumn(name = "leave_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private Set<User> userLeaves;

    public Leaves() {
    }

    public Leaves(String userId, Date leaveApplyFrom, Date leaveApplyTo, int totalDayOfLeave, String leaveDescription, String leaveReason, String leaveType, String leaveStatus, String applyWhom, String modifyToWhom, String leaveActionBy) {
        this.userId = userId;
        this.leaveApplyFrom = leaveApplyFrom;
        this.leaveApplyTo = leaveApplyTo;
        this.totalDayOfLeave = totalDayOfLeave;
        this.leaveDescription = leaveDescription;
        this.leaveReason = leaveReason;
        this.leaveType = leaveType;
        this.leaveStatus = leaveStatus;
        this.applyWhom = applyWhom;
        this.modifyToWhom = modifyToWhom;
        this.leaveActionBy = leaveActionBy;
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

    public Date getLeaveApplyDate() {
        return leaveApplyDate;
    }

    public void setLeaveApplyDate(Date leaveApplyDate) {
        this.leaveApplyDate = leaveApplyDate;
    }

    public Date getLeaveApplyFrom() {
        return leaveApplyFrom;
    }

    public void setLeaveApplyFrom(Date leaveApplyFrom) {
        this.leaveApplyFrom = leaveApplyFrom;
    }

    public Date getLeaveApplyTo() {
        return leaveApplyTo;
    }

    public void setLeaveApplyTo(Date leaveApplyTo) {
        this.leaveApplyTo = leaveApplyTo;
    }

    public String getLeaveReason() {
        return leaveReason;
    }

    public void setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public String getLeaveStatus() {
        return leaveStatus;
    }

    public void setLeaveStatus(String leaveStatus) {
        this.leaveStatus = leaveStatus;
    }

    public String getApplyWhom() {
        return applyWhom;
    }

    public void setApplyWhom(String applyWhom) {
        this.applyWhom = applyWhom;
    }

    public String getModifyToWhom() {
        return modifyToWhom;
    }

    public void setModifyToWhom(String modifyToWhom) {
        this.modifyToWhom = modifyToWhom;
    }

    public String getLeaveActionBy() {
        return leaveActionBy;
    }

    public void setLeaveActionBy(String leaveActionBy) {
        this.leaveActionBy = leaveActionBy;
    }

    public Set<User> getUserLeaves() {
        return userLeaves;
    }

    public void setUserLeaves(Set<User> userLeaves) {
        this.userLeaves = userLeaves;
    }
}
