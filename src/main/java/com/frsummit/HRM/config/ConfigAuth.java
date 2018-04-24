package com.frsummit.HRM.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("configAuth")
public class ConfigAuth {

    @Autowired
    private ConfigServe configServe;

    public Config configName(){
        List<Config> confList = configServe.findAllConfigName();
        Config config = confList.get(0);
        return config;
    }
}
