package com.frsummit.HRM.service;

import com.frsummit.HRM.model.User;

import java.util.List;

public interface UserService {

//    first Administration id
    public void createAdmin();

//    Find

    public User findUserByName(String email);
    public User findUserByEmail(String email);
    public User findUserById(String id);
    public List<User> findAllUsers();

//    Save and Update

    public void saveUser(User user, String usrRole);
    public void updateUser(String fn, String mn, String ln, String email, String dept, String desg, String dob, String sex,
                       String phone, String bg, String father, String mother, String nid, String passport);
//                       String pr_h, String pr_st, String pr_po, String pr_city, String pr_dis, String pr_cntry,
//                       String p_h, String p_st, String p_po, String p_city, String p_dis, String p_cntry);


    public User getUserId(String email);
    public void myMail();
    public List<User> findAllUsersId();
}
