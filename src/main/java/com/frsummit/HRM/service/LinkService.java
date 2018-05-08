package com.frsummit.HRM.service;

import com.frsummit.HRM.model.Links;

import java.util.List;

public interface LinkService {

    public void saveLink(Links links);
    public List<Links> findAllLinks();
}
