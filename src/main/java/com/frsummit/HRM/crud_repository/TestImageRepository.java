package com.frsummit.HRM.crud_repository;

import com.frsummit.HRM.model.TestImage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("testImageRepository")
public interface TestImageRepository extends CrudRepository<TestImage, Long> {
}
