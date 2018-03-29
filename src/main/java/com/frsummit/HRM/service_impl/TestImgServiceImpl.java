package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.model.TestImage;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.TestImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Service("testImgService")
@Transactional
public class TestImgServiceImpl implements TestImgService {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<TestImage> findImg() {
        return entityManager.createQuery("SELECT i FROM TestImage AS i WHERE i.id= 1", TestImage.class).getResultList();
    }
}
