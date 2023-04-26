package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.java.component.RegisterUser;
import com.java.component.Transaction;
import com.java.dao.GenericDao;
import com.java.dao.LocalDao;


@Component
public class Service {
	
	@Autowired
	private LocalDao dao;
	//LocalDao dao=new LocalDao();
	@Transactional
	public int fetchShoppingTotal(int userid)
	{
		
		List<Transaction> list=dao.fetchShoppingtotal(userid);
		int temp=0;
		for(Transaction t:list)
		{
			temp=temp+t.getAmount();
		}
		return temp;
		
	}
	public RegisterUser verifyLogin(String username,String Password)
	{
		RegisterUser reg=dao.verifyLogin(username, Password);
		return reg;
	}
	
	
	public int fetchFoodTotal(int userid)
	{
		List<Transaction> list=dao.fetchFoodtotal(userid);
		int temp=0;
		for(Transaction t:list)
		{
			temp=temp+t.getAmount();
		}
		return temp;
		
	}
	
	public int fetchOtherTotal(int userid)
	{
		List<Transaction> list=dao.fetchOthertotal(userid);
		int temp=0;
		for(Transaction t:list)
		{
			temp=temp+t.getAmount();
		}
		return temp;
		
	}
	
	public int fetchMedicalTotal(int userid)
	{
		List<Transaction> list=dao.fetchMedicaltotal(userid);
		int temp=0;
		for(Transaction t:list)
		{
			temp=temp+t.getAmount();
		}
		return temp;
		
	}
	public List<Transaction> fetchTransactionService(int id)
	{
		List <Transaction> list1=dao.fetchTransaction(id);
		return list1;
	}
	
	public List<Transaction> fetchRevenuetxService(int id)
	{
		List <Transaction> list1=dao.fetchRevenueTx(id);
		return list1;
	}
	
	public List<Transaction> fetchExpensetxService(int id)
	{
		List <Transaction> list1=dao.fetchExpenseTx(id);
		return list1;
	}
	
	public boolean isValidusername(String username)
	{
		Long temp=(Long)dao.isValidusername(username);
		if(temp>0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
	
	public boolean isValidmobile(String mobile)
	{
		Long temp=(Long)dao.isValidmobile(mobile);
		if(temp>0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
	
	public boolean isValidemail(String email)
	{
		Long temp=(Long)dao.isValidemail(email);
		if(temp>0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}
