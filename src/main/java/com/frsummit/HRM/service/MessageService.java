package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Message;

import java.util.List;

public interface MessageService {
    public void saveMessage(Message message);
    public List<Message> findMessage();
    public List<Message> findMyALLMessage();
    public List<Message> loadALLMessage();
}
