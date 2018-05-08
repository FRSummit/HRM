package com.frsummit.HRM.model;


import javax.persistence.*;

@Entity
@Table(name = "links")
public class Links {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String linkName;

    @Column(name = "link_url")
    private String url;

    public Links() {
    }

    public Links(String linkName, String url) {
        this.linkName = linkName;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
