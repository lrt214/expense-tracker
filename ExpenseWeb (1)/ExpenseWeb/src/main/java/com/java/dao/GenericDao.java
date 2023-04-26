package com.java.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component("GenDao")
public class GenericDao {
	
	
	@PersistenceContext
	protected EntityManager entityManager;
	
	@Transactional
	public void add(Object obj) {
		entityManager.merge(obj);
	}

	public Object fetchByPk(Class clazz,Object pk) {
		 Object obj=entityManager
				.find(clazz,pk);
		 return obj;
				
	}

}
