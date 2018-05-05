package com.frsummit.HRM.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "role")
public class Role implements Serializable {

    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "role")
    private String role;

    @Column(name = "role_chain")
    private String roleChain;

    public Role() {
    }

    public Role(int id, String role, String roleChain) {
        this.id = id;
        this.role = role;
        this.roleChain = roleChain;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRoleChain() {
        return roleChain;
    }

    public void setRoleChain(String roleChain) {
        this.roleChain = roleChain;
    }
}
