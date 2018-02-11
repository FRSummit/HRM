package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.jpa_repository.RoleRepository;
import com.frsummit.HRM.jpa_repository.UserRepository;
import com.frsummit.HRM.model.Role;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @PersistenceContext
    private EntityManager entityManager;

    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    AuthenticationManagerBuilder auth;

    @Value("${spring.queries.users-id-query}")
    private String query1;

//    @Value("${spring.queries.users-list}")
//    private String usersListQuery;

    JdbcTemplate template;
    private User eml, i, nm;
    String e, iii;

    @Override
    public User findUserByEmail(String email) {

//        eml = userRepository.findByEmail(email);
//        e = eml.getEmail().toString();
        return userRepository.findByEmail(email);
    }

    @Override
    public User findUserById(String id) {
//        i = userRepository.findById(id);
//        e = i.getId().toString();
//        //j = i.getId();
//        return userRepository.findById(id);

        return null;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public void myMail() {
        //System.out.println(eml.getEmail());
//        System.out.println(i.getId());
//        System.out.println(e);
        //System.out.println(nm.getName());


//        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User AS u WHERE u.user_id=:id", User.class);
//        query.executeUpdate();


        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        //User user = userService.findUserByEmail(auth.getName());
        User u = userRepository.findByEmail(auth.getName());

        iii = u.getId().toString();
        System.out.println("This is start");
        System.out.println("This is u : " + u);
        System.out.println("This is u.get : " + iii);

//        String ss = eml.getEmail();
//        String[] parts = ss.split("@");
//        System.out.println(parts[0] + " @ " + parts[1]);

    }



    @Override
    @Modifying
//    @Query
    public void updateName(String name, String lastName) {
//        if(email == myId())
//            userRepository.updateName(email, name);
//        else
//            System.out.println("Fail");

//        TypedQuery<User> query = entityManager.createQuery("UPDATE User u SET u.name = :name WHERE u.email='" + eml.getEmail() +"'", User.class);
        Query query = entityManager.createQuery("UPDATE User u SET u.name = '" + name + "' , u.lastName = '" + lastName + "' WHERE u.id='" + myId() +"'");
        //query.setParameter("email", email);
        query.executeUpdate();
//
//        User u = new User(email, name);
//        u.setId(u.getId());
//        u.setName(name);
//        userRepository.save(u);
    }

    public String myId(){

        String myId;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        //User user = userService.findUserByEmail(auth.getName());
        User u = userRepository.findByEmail(auth.getName());
        myId = u.getId().toString();
        //myId = (Integer.parseInt( u.getId()));
        //myId = u.getEmail().toString();
        return myId;
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @Override
    public User findUserByName(String name) {
//        nm =  userRepository.findByName(name);
//        return userRepository.findByName(name);
        return  null;
    }

    @Override
    public void saveUser(User user, String usrRole) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepository.findByRole(usrRole);
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        user.setMyRole(usrRole);
        userRepository.save(user);
        System.out.println(user);
    }

    public List<User> findAllUsers(){
//        //return entityManager.createQuery("SELECT u FROM User AS u", User.class).getResultList();
//        return entityManager.createQuery(usersListQuery, User.class).getResultList();
        return null;
    }

    public List<User> findAllUsersId(){
        return entityManager.createQuery("SELECT u FROM User AS u WHERE u.id= '" + myId() + "'", User.class).getResultList();
    }

    @Override
    public void update(User user) {

//        String sql = "UPDATE User SET ID=:id, NAME=:name, LASTNAME=:lastName WHERE email=:email";
//        namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(user));
//        System.out.println(sql);
        //User eml= findUserByEmail(user.getEmail());
        //System.out.println(eml);

        //entityManager.merge(user);

        //String sql="update User set id="+user.getId()+", namae='"+user.getName()+"', last_name='"+user.getLastName()+"' where email='"+user.getEmail()+"'";
        //return template.update(sql);
        //user.setActive(1);
        //userRepository.save(user);
        //System.out.println(user);


    }


    private SqlParameterSource getSqlParameterByModel(User user) {

        // Unable to handle List<String> or Array
        // BeanPropertySqlParameterSource

        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("id", user.getId());
        paramSource.addValue("name", user.getFirstName());
        paramSource.addValue("lastName", user.getLastName());
        return paramSource;
    }

    public User getUserId(String email){
        TypedQuery<User> query = entityManager.createQuery("SELECT u.user_id FROM User AS u WHERE e.email=:email", User.class);
        query.setParameter("email", email);

        return getSingleResultOrNull(query);
    }

    private User getSingleResultOrNull(TypedQuery<User> query) {
        query.setMaxResults(1);
        List<User> list = query.getResultList();
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }
}
