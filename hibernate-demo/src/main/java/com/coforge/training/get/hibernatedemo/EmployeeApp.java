package com.coforge.training.get.hibernatedemo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/*
 * Hibernate Program to persist Employee Object using XML Configuraton
 *
 */
public class EmployeeApp 
{
    public static void main( String[] args )
    {
    	//It is used to configure hibernate App
    	
    	Configuration cfg = new Configuration();
    	cfg.configure("hibernate.cfg.xml");
    	
    	//It is a factory of Sessions
    	SessionFactory sf= cfg.buildSessionFactory();
    	
    	//Create Physical Connection with db
    	Session session = sf.openSession();
    	Transaction t= session.beginTransaction();
    	
    	Employee e1 = new Employee();
    	
    	e1.setId(105);
    	e1.setFirstName("Abhi");
    	e1.setLastName("Nair");
    	e1.setDept("Testing");
    	e1.setSalary(9000.00f);
    	
    	session.persist(e1);  //Save object to DB
    	t.commit();
    	
    	System.out.println("Data Successfully Saved to Database");
    	session.close();
    	sf.close();
    }
}
