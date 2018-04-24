package com.frsummit.HRM.config;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("configRepo")
public interface ConfigRepo extends CrudRepository<Config, Integer> {
}
