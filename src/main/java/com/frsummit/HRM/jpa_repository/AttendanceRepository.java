package com.frsummit.HRM.jpa_repository;

import com.frsummit.HRM.model.Attendance;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("attendanceRepository")
public interface AttendanceRepository extends CrudRepository<Attendance, Integer> {
}
