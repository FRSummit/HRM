package com.frsummit.HRM.config;

public interface ConfigServe {

    public void saveConf(Config config);

    public void saveProfileConfig(Config config);
    public void saveLeaveConfig(Config config);
    public void savePayrollEarningConfig(Config config);
    public void savePayrollDeductionConfig(Config config);
}
