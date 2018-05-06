package com.frsummit.HRM.service_impl;

import com.frsummit.HRM.crud_repository.LeaveRepository;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

    @Override
    @Modifying
    public void updateLeave(String leaveId, String leaveStatus) {
        Query query = entityManager.createQuery("UPDATE Leaves l SET l.leaveStatus = '" + leaveStatus + "' WHERE l.id='" + leaveId +"'");
        query.executeUpdate();
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

    @Override
    @Modifying
    public void updateLeaveStatus(String leaveId, String selectStatus, String leaveActionBy, String modifyTo) {
        Query query = entityManager.createQuery("UPDATE Leaves l SET l.leaveStatus = '" + selectStatus + "', l.leaveActionBy = '" + leaveActionBy + "', l.modifyToWhom = '" + modifyTo + "' WHERE l.id='" + leaveId +"'");
        query.executeUpdate();
        System.out.println(leaveId + " " + selectStatus + " " + leaveActionBy);
    }

    @Override
    public List<Leaves> findLeavesByLeaveId(int id) {
        return entityManager.createQuery("SELECT l FROM Leaves AS l WHERE l.id='" + id +"'", Leaves.class).getResultList();
    }

    ////////////////////////////////////
////    User Section    ////////////
////////////////////////////////////
    @Override
    public List<Leaves> findMyAllLeaves(String userId) {
        return entityManager.createQuery(leavesMyListQuery + userId + "'", Leaves.class).getResultList();
    }

    @Override
    @Modifying
    public void cancelLeave(int id) {
        System.out.println("3");

//        TypedQuery<User> query = entityManager.createQuery("UPDATE User u SET u.name = :name WHERE u.email='" + eml.getEmail() +"'", User.class);
        Query query = entityManager.createQuery("UPDATE Leaves l SET l.cancellationLeaveStatus= 'True' WHERE l.id='" + id +"'");
        //query.setParameter("email", email);
        query.executeUpdate();
        System.out.println("4");
    }
}
