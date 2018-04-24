package com.frsummit.HRM.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Service("configServe")
@Transactional
public class ConfigServImpl implements ConfigServe {

    @Autowired
    private ConfigRepo configRepo;

    @Autowired
    private EntityManager entityManager;

    @Override
    public void saveConf(Config config) {
        configRepo.save(config);
    }

    @Override
    public void saveProfileConfig(Config config) {
        configRepo.save(config);
    }

    @Override
    public void saveLeaveConfig(Config config) {
        configRepo.save(config);
    }

    @Override
    public void savePayrollEarningConfig(Config config) {
        configRepo.save(config);
    }

    @Override
    public void savePayrollDeductionConfig(Config config) {
        configRepo.save(config);
    }

    @Override
    public List<Config> findAllConfigName() {
        return entityManager.createQuery("SELECT c FROM Config AS c", Config.class).getResultList();
    }

}
