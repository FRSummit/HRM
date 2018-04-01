package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Attendance;

import java.util.List;

public interface AttendanceService {

    public void saveAttendance(Attendance attendance);
    public void updateAttendance(Attendance attendance);
    public List<Attendance> myAllSignList();
    public List<Attendance> UsersSignList();
}
