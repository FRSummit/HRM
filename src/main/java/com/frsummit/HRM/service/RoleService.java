package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Role;

import java.util.List;

public interface RoleService {

    public List<Role> findAllRole(String role);
    public List<Role> findAllRoles();
    public void insertRoleAdmin(Role role);
}
