package com.coforge.training.get.hiberweb;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
*Author :Mekapothula.Reddy
*Date : 18 Nov 2024
*Time: 10:05:45 am
*
*Data Access Layer - Hibernate
*/

public class UserDAO {
	
	 public void addUserDetails(String userName, String password, String email,
	            String phone, String city) {
		 
	        try {
	            // 1. configuring hibernate
	            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
	 
	            // 2. create sessionfactory
	            SessionFactory sessionFactory = configuration.buildSessionFactory();
	 
	            // 3. Get Session object
	            Session session = sessionFactory.openSession();
	 
	            // 4. Starting Transaction
	            Transaction transaction = session.beginTransaction();
	            
	            User user=new User();
	            user.setUserName(userName);
	            user.setPassword1(password);
	            user.setEmail(email);
	            user.setCity(city);
	            user.setPhone(phone);
	            
	            session.persist(user);
	            transaction.commit();
	            System.out.println("\n\n Details Added \n");
	 
	        } catch (HibernateException e) {
	            System.out.println(e.getMessage());
	            System.out.println("error");
	        }
	 
	    }
	
	

}
