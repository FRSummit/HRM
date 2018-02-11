package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Role> findAllUsers(String role) {
        return entityManager.createQuery("SELECT r FROM Role AS r WHERE r.role = '" + role + "'", Role.class).getResultList();
    }
}
