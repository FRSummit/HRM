package com.frsummit.HRM.config;

import java.util.List;

public interface ConfigServe {

    public void saveConf(Config config);

    public void saveProfileConfig(Config config);
    public void saveLeaveConfig(Config config);
    public void savePayrollEarningConfig(Config config);
    public void savePayrollDeductionConfig(Config config);

    public List<Config> findAllConfigName();
}
