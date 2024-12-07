<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="org.hibernate.*,
            		org.hibernate.cfg.Configuration,
            		org.hibernate.query.Query,
            		jakarta.persistence.TypedQuery,
            		com.coforge.training.get.hiberweb.User,
        			java.util.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibernate Select Demo</title>
</head>
<body>
	<h1>Hibernate Select Demo</h1>

<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session sess = factory.openSession();
	sess.beginTransaction();
	
	
	// HQL Select Query - Get all Users
    TypedQuery<User> query = sess.createQuery("from User", User.class);
    List<User> userList = query.getResultList();
    
    out.println("<h3>List of Users:</h3><br>");
    for (User user : userList) {
        out.println(user.getId() + "\t" + user.getUserName() + "\t" + user.getEmail() + "<br>");
    }

	
	 // HQL Query - Select names
    String hql = "select U.userName from User U";
    TypedQuery<String> nameQuery = sess.createQuery(hql, String.class);
    List<String> names = nameQuery.getResultList();
    out.println("List of Names:<br>");
    for (String name : names) {
        out.println(name + "<br>");
    }
    out.println("<br/>");
	 
	 out.println("<br/>");
	  
	 // HQL Query - Count Users
	    Query<Long> countQuery = sess.createQuery("select count(*) from User", Long.class);
	    Long count = countQuery.getSingleResult();
	    out.println("Total Users:<br>");
	    out.println(count + "<br>");
	    out.println("<br/>");

	    // HQL Query with Named Parameters
	    TypedQuery<User> paramQuery = sess.createQuery("from User U where U.id = :id", User.class);
	    paramQuery.setParameter("id", 2);
	    List<User> usersWithId = paramQuery.getResultList();
	    out.println("List of Users with ID = 2:<br>");
	    for (User user : usersWithId) {
	        out.println(user.getId() + "," + user.getUserName() + "," + user.getEmail() + "<br>");
	    }

		 
		 sess.getTransaction().commit();
		 sess.close();
		 factory.close();
	
%>



</body>
</html>