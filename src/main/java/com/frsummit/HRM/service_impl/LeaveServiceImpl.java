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

/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Application Properties //////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
    @Value("${spring.queries.leaves-list}") //Load * from leaves
    private String leavesListQuery;

    @Value("${spring.queries.my-leaves-list}")  //For every User separately
    private String leavesMyListQuery;

    @Value("${spring.queries.all-leaves-by-role}")  // find by  applyToWhom
    private String leavesByRole;

    @Value("${spring.query.leave-status-pending}")  // find by  status = Pending
    private String leaveStatusPending;

    @Value("${spring.query.leave-modify-to-whom}")  // find by  modifyToWhom
    private String leaveModifyToWhom;

/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Services Start //////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public void saveLeave(Leaves leaves) {
        leaveRepository.save(leaves);
    }

//////////////////////////////////////
/////    Admin Section    ////////////
//////////////////////////////////////
    @Override
    public List<Leaves> findAllLeaves() {
        return entityManager.createQuery(leavesListQuery, Leaves.class).getResultList();
    }

    @Override
    public List<Leaves> findAllLeavesByRole(String userRole) {
        return entityManager.createQuery(leavesByRole + userRole + "'" + leaveStatusPending + leaveModifyToWhom + userRole + "'", Leaves.class).getResultList();
    }

    @Override
    public List<Leaves> findAllRecentLeavesByRole(String userRole) {
        return null;
    }

////////////////////////////////////
////    User Section    ////////////
////////////////////////////////////
    @Override
    public List<Leaves> findMyAllLeaves(String userId) {
        return entityManager.createQuery(leavesMyListQuery + userId + "'", Leaves.class).getResultList();
    }
}
