package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Attendance;

import java.util.List;

public interface AttendanceService {

    public void saveAttendance(Attendance attendance);
    public void remarkAttendance(String attendId);
    public void removeFromRemarkList(String attendId);
    public void updateAttendance(Attendance attendance, String userId);
    public List<Attendance> myAllSignList();
    public List<Attendance> UsersSignList();
    public List<Attendance> remarkAttendanceList();
}
