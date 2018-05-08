package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.LinkRepository;
import com.frsummit.HRM.model.Links;
import com.frsummit.HRM.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Service("linkService")
@Transactional
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkRepository linkRepository;

    @Autowired
    private EntityManager entityManager;

    @Override
    public void saveLink(Links links) {
        linkRepository.save(links);
    }

    @Override
    public List<Links> findAllLinks() {
        return entityManager.createQuery("SELECT l FROM Links AS l", Links.class).getResultList();
    }
}
