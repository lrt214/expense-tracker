package com.java.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.java.component.RegisterUser;
import com.java.component.Transaction;

@Component("LocalDao")
public class LocalDao {
	@PersistenceContext
	protected EntityManager entityManager;

@Transactional
public RegisterUser verifyLogin(String username,String Password)
{
	try
	{
	return (RegisterUser) entityManager.createQuery("select t from  RegisterUser t where t.username=:temp and t.password=:temp2").setParameter("temp", username).setParameter("temp2", Password).getSingleResult();
	}
	catch(Exception e)
	{
		return null;
	}
	}

public List<Transaction> fetchShoppingtotal(int id)
{
	return  entityManager.createQuery("select t from  Transaction t where t.regUser.id=:temp and t.type=:temp2").setParameter("temp", id).setParameter("temp2", "Shopping").getResultList();
}
@Transactional
public List<Transaction> fetchFoodtotal(int id)
{
	return  entityManager.createQuery("select t from  Transaction t where t.regUser.id=:temp and t.type=:temp2").setParameter("temp", id).setParameter("temp2", "Food").getResultList();
}
@Transactional
public List<Transaction> fetchOthertotal(int id)
{
	return  entityManager.createQuery("select t from  Transaction t where t.regUser.id=:temp and t.type=:temp2").setParameter("temp", id).setParameter("temp2", "Other").getResultList();
}


public List<Transaction> fetchMedicaltotal(int id)
{
	return  entityManager.createQuery("select t from  Transaction t where t.regUser.id=:temp and t.type=:temp2").setParameter("temp", id).setParameter("temp2", "Medical").getResultList();
}

@Transactional
public List<Transaction> fetchTransaction(int id)
{
	return entityManager.createQuery("select t from Transaction t where t.regUser.id=:temp order by t.id desc").setParameter("temp", id).setMaxResults(10).getResultList();

}

@Transactional
public List<Transaction> fetchRevenueTx(int id)
{
	return entityManager.createQuery("select t from Transaction t where t.regUser.id=:temp and t.category=:temp2 order by t.id desc").setParameter("temp", id).setParameter("temp2", "Revenue").setMaxResults(10).getResultList();

}

@Transactional
public List<Transaction> fetchExpenseTx(int id)
{
	return entityManager.createQuery("select t from Transaction t where t.regUser.id=:temp and t.category=:temp2 order by t.id desc").setParameter("temp", id).setParameter("temp2", "expense").setMaxResults(10).getResultList();

}
 


public Long isValidusername(String username)
{
	return   (Long) entityManager.createQuery("select count(t) from RegisterUser t where t.username=:temp").setParameter("temp", username).getSingleResult();

}


public Long isValidmobile(String mobile)
{
	return (Long) entityManager.createQuery("select count(t) from RegisterUser t where t.mob_no=:temp").setParameter("temp", mobile).getSingleResult();

}


public Long isValidemail(String email)
{
	return (Long)  entityManager.createQuery("select count(t) from RegisterUser t where t.email=:temp").setParameter("temp", email).getSingleResult();

}

 

public static void main(String[] args) {
	LocalDao dao=new LocalDao();
	List<Transaction>list1= dao.fetchShoppingtotal(2);
	for(Transaction t:list1)
	{
		System.out.println(t.getAmount());
	}
}


}
