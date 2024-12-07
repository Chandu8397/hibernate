package com.coforge.training.get.hibernatedemo;

import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/*
 * Hibernate Program to persist Student Object using Annotation Configuraton
 */

public class StudentApp {

	public static void main(String[] args) {
		
		Configuration cfg=new Configuration();  
	    cfg.configure("hibernate.cfg.xml");  
	    SessionFactory sf=cfg.buildSessionFactory();  
	    Session session=sf.openSession();  
	          
	    Transaction t=session.beginTransaction(); 
	    
	    Student s1=new Student();
	    
	    Scanner s=new Scanner(System.in);
	    System.out.println("Enter Name, Branch & Marks :");
	    
	    String name=s.next();
	    String branch=s.next();
	    float marks=s.nextFloat();
	    
	   s1.setName(name);
	   s1.setBranch(branch);
	   s1.setMarks(marks);
	   
	   	s.close();
	    
	    session.persist(s1);
	    t.commit();
	    System.out.println("Student Details successfully Saved to DB");
	    session.close();
	    sf.close();

		

	}

}
