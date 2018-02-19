package com.frsummit.HRM.crud_repository;

import com.frsummit.HRM.model.EmergencyContact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository("emergencyContactRepository")
public interface EmergencyContactRepository extends CrudRepository<EmergencyContact, Long> {
}
