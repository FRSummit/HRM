package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.RoleRepository;
import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @PersistenceContext
    private EntityManager entityManager;

    @Value("${spring.queries.role-for-admin}")
    private String query1;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<Role> findAllRole(String role) {
        return entityManager.createQuery("SELECT r FROM Role AS r WHERE r.role = '" + role + "'", Role.class).getResultList();
    }

    @Override
    public void insertRoleAdmin(Role role) {
        if(roleList().size()==0){
            roleRepository.save(role);
        }
    }

    public List<Role> roleList(){
        return entityManager.createQuery("SELECT r FROM Role AS r", Role.class).getResultList();
    }
}
