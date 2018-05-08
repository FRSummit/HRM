package com.frsummit.HRM.crud_repository;


import com.frsummit.HRM.model.Links;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("linkRepository")
public interface LinkRepository extends CrudRepository<Links, Integer> {

    Links findById(int id);
}
