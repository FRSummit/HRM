package com.frsummit.HRM.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "message")
public class Message implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int messageId;

    @Column(name = "user_id")
    private String messageUserId;

    @Column(name = "leave_id")
    private String leaveId;

    @Column(name = "message")
    private String message;

    @Column(name = "checking")
    private String messageCheck;

    public Message() {
    }

    public Message(String leaveId, String message, String messageCheck) {
        this.leaveId = leaveId;
        this.message = message;
        this.messageCheck = messageCheck;
    }

    public int getMessageId() {

        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getMessageUserId() {
        return messageUserId;
    }

    public void setMessageUserId(String messageUserId) {
        this.messageUserId = messageUserId;
    }

    public String getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(String leaveId) {
        this.leaveId = leaveId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessageCheck() {
        return messageCheck;
    }

    public void setMessageCheck(String messageCheck) {
        this.messageCheck = messageCheck;
    }
}
