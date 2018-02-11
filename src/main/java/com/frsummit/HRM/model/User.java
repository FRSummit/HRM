package com.frsummit.HRM.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @Column(name = "id", nullable = false)
    @NotEmpty(message = "*Please provide user id")
    private String id;

    @Column(name = "f_name")
    @NotEmpty(message = "*Please provide your First Name")
    private String firstName;

    @Column(name = "m_name")
    private String middleName;

    @Column(name = "l_name")
    @NotEmpty(message = "*Please provide your Last Name")
    private String lastName;

    @Column(name = "email")
    @Email(message = "*Please provide a valid email")
    @NotEmpty(message = "Please provide an email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "dob")
    private String dob;

    @Embedded
    @AttributeOverrides(
            {
                    @AttributeOverride(
                            name = "house",
                            column = @Column(name = "present_house")
                    ),
                    @AttributeOverride(
                            name = "street",
                            column = @Column(name = "present_street")
                    ),
                    @AttributeOverride(
                            name = "postOffice",
                            column = @Column(name = "present_post_office")
                    ),
                    @AttributeOverride(
                            name = "city",
                            column = @Column(name = "present_city")
                    ),
                    @AttributeOverride(
                            name = "district",
                            column = @Column(name = "present_districe")
                    ),
                    @AttributeOverride(
                            name = "country",
                            column = @Column(name = "present_country")
                    )
            }
    )
    private Address presentAddress;

    @Embedded
    @AttributeOverrides(
            {
                    @AttributeOverride(
                            name = "house",
                            column = @Column(name = "permanent_house")
                    ),
                    @AttributeOverride(
                            name = "street",
                            column = @Column(name = "permanent_street")
                    ),
                    @AttributeOverride(
                            name = "postOffice",
                            column = @Column(name = "permanent_post_office")
                    ),
                    @AttributeOverride(
                            name = "city",
                            column = @Column(name = "permanent_city")
                    ),
                    @AttributeOverride(
                            name = "district",
                            column = @Column(name = "permanent_districe")
                    ),
                    @AttributeOverride(
                            name = "country",
                            column = @Column(name = "permanent_country")
                    )
            }
    )
    private Address permanentAddress;

    @Column(name = "designation")
    private String designation;

    @Column(name = "department")
    private String deaprtment;

    @Column(name = "image_name")
    private String imageName;

    @Column(name = "blood_group")
    private String bloodGroup;

    @Column(name = "sex")
    private String sex;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "mother_name")
    private String motherName;

    @Column(name = "nid")
    private String nid;

    @Column(name = "passport_No")
    private String passportNumber;

    @Column(name = "nationality")
    private String nationality;

    @Column(name = "income_tex_no")
    private String incomeTexNo;

    @Column(name = "password")
    @Length(min = 5, message = "*Your password must have at least 5 characters")
    @NotEmpty(message = "*Please provide password")
    private String password;

    @Column(name = "my_role")
    private String myRole;

    @Column(name = "active")
    private int active;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMyRole() {
        return myRole;
    }

    public void setMyRole(String myRole) {
        this.myRole = myRole;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public Address getPresentAddress() {
        return presentAddress;
    }

    public void setPresentAddress(Address presentAddress) {
        this.presentAddress = presentAddress;
    }

    public Address getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(Address permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDeaprtment() {
        return deaprtment;
    }

    public void setDeaprtment(String deaprtment) {
        this.deaprtment = deaprtment;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getIncomeTexNo() {
        return incomeTexNo;
    }

    public void setIncomeTexNo(String incomeTexNo) {
        this.incomeTexNo = incomeTexNo;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
