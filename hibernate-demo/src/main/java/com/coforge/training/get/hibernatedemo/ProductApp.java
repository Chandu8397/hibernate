package com.coforge.training.get.hibernatedemo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/*
 * Hibernate Program to save Product Object using XML Configuration
 * 
 */
public class ProductApp {

	public static void main(String[] args) {
		
//It is used to configure hibernate App
    	
    	Configuration cfg = new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	
    	//It is a factory of Sessions
    	SessionFactory sf= cfg.buildSessionFactory();
    	
    	//Create Physical Connection with db
    	Session session = sf.openSession();
    	Transaction t= session.beginTransaction();
    	
    	Product p1 = new Product("Samsung Television","Sound Quality Dolby Atoms", 38000.00f);
    	
    	
    	
    	session.persist(p1);  //Save object to DB
    	t.commit();
    	
    	System.out.println("Data Successfully Saved to Database");
    	session.close();
    	sf.close();
		
	}

}
