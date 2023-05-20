package com.sofiene.dropshop.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sofiene.dropshop.models.Category;

@Repository
public interface Categoryinterface extends CrudRepository<Category, Long>{
	List<Category> findAll();

}
