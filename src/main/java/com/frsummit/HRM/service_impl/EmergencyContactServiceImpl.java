package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.EmergencyContactRepository;
import com.frsummit.HRM.crud_repository.UserRepository;
import com.frsummit.HRM.model.EmergencyContact;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.EmergencyContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;

@Service("emergencyContactService")
@Transactional
public class EmergencyContactServiceImpl implements EmergencyContactService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmergencyContactRepository emergencyContactRepository;

    @Override
    public void saveEmergencyContact(EmergencyContact emergencyContact) {
        emergencyContactRepository.save(emergencyContact);
    }
}
