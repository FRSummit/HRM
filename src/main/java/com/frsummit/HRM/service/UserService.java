package com.frsummit.HRM.service;

import com.frsummit.HRM.model.User;

import java.util.List;

public interface UserService {

    public User findUserByName(String email);
    public User findUserByEmail(String email);
    public User findUserById(String id);
    public void saveUser(User user, String usrRole);
    public List<User> findAllUsers();
    public void update(User user);
    public void updateName(String name, String lastName);
    public User getUserId(String email);
    public void myMail();
    public List<User> findAllUsersId();
}
