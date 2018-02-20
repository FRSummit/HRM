package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.LeaveRepository;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service("leaveService")
@Transactional
public class LeaveServiceImpl implements LeaveService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private LeaveRepository leaveRepository;

    @Value("${spring.queries.leaves-list}")
    private String leavesListQuery;

    @Value("${spring.queries.my-leaves-list}")
    private String leavesMyListQuery;

//    Admin Section
    @Override
    public void saveLeave(Leaves leaves) {
        leaveRepository.save(leaves);
    }

    @Override
    public List<Leaves> findAllLeaves() {
        return entityManager.createQuery(leavesListQuery, Leaves.class).getResultList();
    }

//    User Section
    @Override
    public List<Leaves> findMyAllLeaves(String userId) {
        return entityManager.createQuery(leavesMyListQuery + userId + "'", Leaves.class).getResultList();
    }
}
