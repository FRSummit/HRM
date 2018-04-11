package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.AttendanceRepository;
import com.frsummit.HRM.crud_repository.UserRepository;
import com.frsummit.HRM.model.Attendance;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

@Service("attendanceService")
@Transactional
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    protected AttendanceRepository attendanceRepository;

    @Autowired
    protected EntityManager entityManager;

    @Autowired
    protected UserRepository userRepository;

    @Override
    public void saveAttendance(Attendance attendance) {
        attendanceRepository.save(attendance);
    }

    @Override
    @Modifying
    public void remarkAttendance(String attendId) {
        Query query = entityManager.createQuery("UPDATE Attendance a SET a.attendanceRemark = 'REMARK' WHERE a.attendId='" + attendId +"'");
        query.executeUpdate();
    }

    @Override
    @Modifying
    public void removeFromRemarkList(String attendId) {
        Query query = entityManager.createQuery("UPDATE Attendance a SET a.attendanceRemark = 'FALSE' WHERE a.attendId='" + attendId +"'");
        query.executeUpdate();
    }

    @Override
    @Modifying
    public void updateAttendance(Attendance attendance, String userId) {
        Query query = entityManager.createQuery("UPDATE Attendance a SET a.attendanceRemark = '" + attendance + "' WHERE a.userId='" + userId +"'");
        query.executeUpdate();
    }

    @Override
    public List<Attendance> myAllSignList() {
        return entityManager.createQuery("SELECT a FROM Attendance AS a WHERE a.userId= '" + myId() + "'", Attendance.class).getResultList();

    }

    @Override
    public List<Attendance> UsersSignList() {
        return entityManager.createQuery("SELECT a FROM Attendance AS a", Attendance.class).getResultList();
    }

    @Override
    public List<Attendance> remarkAttendanceList() {
        return entityManager.createQuery("SELECT a FROM Attendance AS a WHERE a.attendanceRemark = 'REMARK'", Attendance.class).getResultList();
    }

    public  Attendance findLastPunch(){
        List<Attendance> attendancesList = findAllUserPunches();
        Attendance attendanceInOut = attendancesList.get(attendancesList.size()-1);
        if(attendanceInOut.getInTime() == null){
            attendanceInOut.setInTime(Calendar.getInstance());
        }else attendanceInOut.setOutTime(Calendar.getInstance());
        return attendanceInOut;
    }

    public List<Attendance> findAllUserPunches(){
        return entityManager.createQuery("SELECT a FROM Attendance AS a WHERE a.userId= '" + myId() + "'", Attendance.class).getResultList();
    }

    public String myId(){

        String myId;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        //User user = userService.findUserByEmail(auth.getName());
        User user1 = userRepository.findByEmail(auth.getName());
        User user2 = userRepository.findById(auth.getName());
        User user;
        if(user1 != null) user = user1;
        else user = user2;
        myId = user.getId().toString();
        //myId = (Integer.parseInt( u.getId()));
        //myId = u.getEmail().toString();
        return myId;
    }
}
