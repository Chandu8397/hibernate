package com.coforge.training.get.hiberweb;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *Author :Mekapothula.Reddy
 *Date : 19 Nov 2024
 *Tme: 10:47:02 am
 */

public class EmployeeDAO {

	public void addEmployeeDetails(String name, String department, double salary) {
		 
        try {
            // 1. configuring hibernate
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
 
            // 2. create sessionfactory
            SessionFactory sessionFactory = configuration.buildSessionFactory
            		(new StandardServiceRegistryBuilder().configure().build());
 
            // 3. Get Session object
            Session session = sessionFactory.openSession();
 
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            
            //Create an Employee Object
            Employee employee = new Employee();
            employee.setName(name);
            employee.setDepartment(department);
            employee.setSalary(salary);
            
            session.persist(employee);
            
            transaction.commit();
            System.out.println("\n\n Employee saved Successfully \n");
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");

		}
		
	}
}
