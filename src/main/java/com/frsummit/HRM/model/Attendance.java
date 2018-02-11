package com.frsummit.HRM.model;

import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "attendance")
public class Attendance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int attendId;

    @Column(name = "user_id", nullable = false)
    @NotEmpty(message = "Set User id first")
    private String userId;

    @Column(name = "sign_time")
    @UpdateTimestamp
    private Date signTime;

    @Column(name = "in_time")
    @UpdateTimestamp
    private Date inTime;

    @Column(name = "out_time")
    @UpdateTimestamp
    private Date outTime;

    @Column(name = "late_by")
    private Date lateBy;

    //Extra features
    @Column(name = "work_hr_day")
    private Date workHourInDay;

    //Extra features
    @Column(name = "over_time")
    private Date overtime;

    //Extra features
    @Column(name = "shift")
    private String shift;

    //Extra features
    @Column(name = "work_duration")
    private String workDuration;

    @Column(name = "absent")
    private int absent;

    //Extra features
    @Column(name = "performance")
    private double performance;

    //Extra features
    @Column(name = "link1")
    private String attendanceLink1;

    //Extra features
    @Column(name = "link2")
    private String attendanceLink2;

    //Extra features
    @Column(name = "link3")
    private String attendanceLink3;

    //Extra features
    @Column(name = "link4")
    private String attendanceLink4;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "attendance_user", joinColumns = @JoinColumn(name = "attend_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private Set<User> user;

    public int getAttendId() {
        return attendId;
    }

    public void setAttendId(int attendId) {
        this.attendId = attendId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getSignTime() {
        return signTime;
    }

    public void setSignTime(Date signTime) {
        this.signTime = signTime;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public Date getLateBy() {
        return lateBy;
    }

    public void setLateBy(Date lateBy) {
        this.lateBy = lateBy;
    }

    public Date getWorkHourInDay() {
        return workHourInDay;
    }

    public void setWorkHourInDay(Date workHourInDay) {
        this.workHourInDay = workHourInDay;
    }

    public Date getOvertime() {
        return overtime;
    }

    public void setOvertime(Date overtime) {
        this.overtime = overtime;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getWorkDuration() {
        return workDuration;
    }

    public void setWorkDuration(String workDuration) {
        this.workDuration = workDuration;
    }

    public int getAbsent() {
        return absent;
    }

    public void setAbsent(int absent) {
        this.absent = absent;
    }

    public double getPerformance() {
        return performance;
    }

    public void setPerformance(double performance) {
        this.performance = performance;
    }

    public String getAttendanceLink1() {
        return attendanceLink1;
    }

    public void setAttendanceLink1(String attendanceLink1) {
        this.attendanceLink1 = attendanceLink1;
    }

    public String getAttendanceLink2() {
        return attendanceLink2;
    }

    public void setAttendanceLink2(String attendanceLink2) {
        this.attendanceLink2 = attendanceLink2;
    }

    public String getAttendanceLink3() {
        return attendanceLink3;
    }

    public void setAttendanceLink3(String attendanceLink3) {
        this.attendanceLink3 = attendanceLink3;
    }

    public String getAttendanceLink4() {
        return attendanceLink4;
    }

    public void setAttendanceLink4(String attendanceLink4) {
        this.attendanceLink4 = attendanceLink4;
    }

    /*
    *
    * Time Difference
    * String time1 = "16:00:00";
    * String time2 = "19:00:00";
    *
    * SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
    * Date date1 = format.parse(time1);
    * Date date2 = format.parse(time2);
    * long difference = date2.getTime() - date1.getTime();
    *
    *********************************************************************************************
    *
    * Instant start = Instant.now();
    * Instant end = Instant.now();
    * Duration timeElapsed = Duration.between(start, end);
    * System.out.println("Time taken: "+ timeElapsed.toMillis() +" milliseconds");
    *
    *********************************************************************************************
    *
    * DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    *
    * LocalDateTime dateTime1= LocalDateTime.parse("2014-11-25 19:00:00", formatter);
    * LocalDateTime dateTime2= LocalDateTime.parse("2014-11-25 16:00:00", formatter);
    *
    * long diffInMilli = java.time.Duration.between(dateTime1, dateTime2).toMillis();
    * long diffInSeconds = java.time.Duration.between(dateTime1, dateTime2).getSeconds();
    * long diffInMinutes = java.time.Duration.between(dateTime1, dateTime2).toMinutes();
    *
    * ********************************************************************************************
    *
    *
    *
    * */
}
