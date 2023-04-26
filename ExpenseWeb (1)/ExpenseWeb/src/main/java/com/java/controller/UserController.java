package com.java.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.component.RegisterUser;
import com.java.component.Transaction;
import com.java.dao.GenericDao;
import com.java.dao.LocalDao;
import com.java.service.Service;
import com.java.validation.ServerValidation;

@Controller
public class UserController {
	HttpSession session;
	@Autowired
	private GenericDao dao;
	
	@Autowired
	private LocalDao dao2;
	
	
	 ServerValidation valid=new ServerValidation();
	
	@Autowired
	private Service service;
	
	@RequestMapping("/register.app")
	public String register(RegisterUser obj,Map map)
	{
		boolean isValidusername=service.isValidusername(obj.getUsername());
		boolean isValidmobile=service.isValidmobile(obj.getMob_no());
		boolean isValidemail=service.isValidemail(obj.getEmail());
		
		if(isValidusername && isValidmobile && isValidemail )
		{
			dao.add(obj);
			return "logIn.jsp";
		}
		else
		{
			
			if(isValidusername==false)
			{
				valid.setIsValidUser("Username already exist");
				//map.put("isUserValid", );
			}
			else
			{
				 valid.setIsValidUser("");
				//map.put("isUserValid",);
			}
			 if(isValidmobile==false)
			{
				 valid.setIsValidMobile("Mobile Number already exist");
				//map.put("isMobileValid",);

			}
			 else
			 {
				 valid.setIsValidMobile("");
				// map.put("isMobileValid",);

			 }
			 if(isValidemail==false)
			{
				 valid.setIsValidEmail("Email Already exist");
				///map.put("isEmailValid", );

			}
			 else
			 {
				 valid.setIsValidEmail("");
				// map.put("isEmailValid", );
			 }
			 System.out.println(valid.getIsValidUser());
			 System.out.println(valid.getIsValidMobile());
			 System.out.println(valid.getIsValidEmail());
			 map.put("valid", valid);
			 map.put("obj", obj);
			 return "signUp.jsp";
		}
		
		
		
	}
	
	@RequestMapping("/login.app")
	
	public String login(HttpServletRequest request,Map map)
	{
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		RegisterUser user=service.verifyLogin(username, password);
		if(user==null)
		{
			valid.setLoginError("You entered Wrong Username or Password");
			map.put("valid",valid);
			return "logIn.jsp";
		}
		request.getSession().setAttribute("user_obj",user);
		System.out.println(user.getName());
		Integer t=service.fetchShoppingTotal(user.getId());
		System.out.println(t);
		request.getSession().setAttribute("shopping_total",t);
		
		Integer ftotal=service.fetchFoodTotal(user.getId());
		request.getSession().setAttribute("food_total",ftotal);
		
		Integer ototal=service.fetchOtherTotal(user.getId());
		request.getSession().setAttribute("other_total",ototal);
		
		Integer mtotal=service.fetchMedicalTotal(user.getId());
		request.getSession().setAttribute("medical_total",mtotal);
		System.out.println(mtotal);
		
		List <Transaction>list1=service.fetchTransactionService(user.getId());
		request.getSession().setAttribute("table_list1", list1);
		
		List <Transaction>list2=service.fetchRevenuetxService(user.getId());
		request.getSession().setAttribute("revenue_list1", list2);
		

		List <Transaction>list3=service.fetchExpensetxService(user.getId());
		request.getSession().setAttribute("expense_list1", list3);
		
		map.put("user", user);
		
		
		
		
		
		return "redirect:index.jsp";
	}
	@RequestMapping("/addexpense.app")
	public String transaction(HttpServletRequest request,Transaction tx)
	{
		tx.setDate(LocalDate.now());
		tx.setCategory("expense");
		int a=tx.getAmount();
		RegisterUser user=(RegisterUser)request.getSession().getAttribute("user_obj");
		int temp=Integer.parseInt(user.getBalance())-a;
		String s=String.valueOf(temp);
		user.setBalance(s);
		dao.add(user);
		tx.setRegUser(user);
		dao.add(tx);
		Integer t=service.fetchShoppingTotal(user.getId());
		request.getSession().setAttribute("shopping_total",t);
		
		Integer ftotal=service.fetchFoodTotal(user.getId());
		request.getSession().setAttribute("food_total",ftotal);
		
		Integer ototal=service.fetchOtherTotal(user.getId());
		request.getSession().setAttribute("other_total",ototal);
		
		Integer mtotal=service.fetchMedicalTotal(user.getId());
		request.getSession().setAttribute("medical_total",mtotal);
		
		
		List <Transaction>list1=service.fetchTransactionService(user.getId());
		request.getSession().setAttribute("table_list1", list1);
		
		List <Transaction>list3=service.fetchExpensetxService(user.getId());
		request.getSession().setAttribute("expense_list1", list3);
		
		
		
		
		
		return "redirect:addExpense.jsp";
	}
	
	@RequestMapping("/addRevenue.app")
	public String addrevenue(HttpServletRequest request,Transaction tx)
	{
		tx.setDate(LocalDate.now());
		tx.setCategory("Revenue");
		int a=tx.getAmount();
		
		RegisterUser user=(RegisterUser)request.getSession().getAttribute("user_obj");
		int temp=a+Integer.parseInt(user.getBalance());
		String s=String.valueOf(temp);
		user.setBalance(s);
		dao.add(user);
		tx.setRegUser(user);
		dao.add(tx);
		List <Transaction>list1=service.fetchTransactionService(user.getId());
		request.getSession().setAttribute("table_list1", list1);
		
		List <Transaction>list2=service.fetchRevenuetxService(user.getId());
		request.getSession().setAttribute("revenue_list1", list2);
		
		return "redirect:addRevenue.jsp";
	}
	
	@RequestMapping("/logout.app")
	public String logout(HttpServletRequest request)
	{
		request.getSession().removeAttribute("table_list1");
		request.getSession().removeAttribute("user_obj");
		request.getSession().removeAttribute("food_total");
		request.getSession().removeAttribute("shopping_total");
		request.getSession().removeAttribute("other_total");
		request.getSession().removeAttribute("medical_total");
		request.getSession().removeAttribute("revenue_list1");
		request.getSession().removeAttribute("expense_list1");
		//RegisterUser reg=(RegisterUser) request.getSession().getAttribute("user_obj");
		//System.out.println(reg.getUsername());
		return "redirect:logIn.jsp";
		
		
	}
	


}
