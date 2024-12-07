package com.coforge.training.assignments;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
*Author :Mekapothula.Reddy
*Date : 2 Dec 2024
*Tme: 10:53:07 pm
*/

public class BookDAO {
	
	public void addUserDetails(String title, String author, String publisher,
			int Quantity) {
        try {
            // 1. configuring hibernate
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            // 2. create sessionfactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            // 3. Get Session object
            Session session = sessionFactory.openSession();
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            Book b1=new Book();
            b1.setTitle(title);
            b1.setAuthor(author);
            b1.setPublisher(publisher);
            b1.setQuantity(Quantity);;
            session.persist(b1);
            transaction.commit();
            System.out.println("\n\n Details Added \n");
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
        }
    }

}
