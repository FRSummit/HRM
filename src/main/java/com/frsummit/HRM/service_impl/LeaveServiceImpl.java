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

//    Load * from leaves
    @Value("${spring.queries.leaves-list}")
    private String leavesListQuery;

//    For every User separately
    @Value("${spring.queries.my-leaves-list}")
    private String leavesMyListQuery;

//    find by  applyToWhom
    @Value("${spring.queries.all-leaves-by-role}")
    private String findAllLeavesByRole;

//    Admin Section
    @Override
    public void saveLeave(Leaves leaves) {
        leaveRepository.save(leaves);
    }

    @Override
    public List<Leaves> findAllLeaves() {
        return entityManager.createQuery(leavesListQuery, Leaves.class).getResultList();
    }

    @Override
    public List<Leaves> findAllLeavesByRole(String userRole) {
        return entityManager.createQuery(findAllLeavesByRole + userRole + "'", Leaves.class).getResultList();
    }

    //    User Section
    @Override
    public List<Leaves> findMyAllLeaves(String userId) {
        return entityManager.createQuery(leavesMyListQuery + userId + "'", Leaves.class).getResultList();
    }
}
