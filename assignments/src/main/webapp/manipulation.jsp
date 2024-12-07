<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.hibernate.*,
					org.hibernate.query.Query,
            		org.hibernate.cfg.Configuration,
            		com.coforge.training.assignments.Book,
            		java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DML Operations using HQL</title>
</head>
<body>

	<h1>DML Operations using HQL</h1>
	<hr>
	<!-- Query<?> instead of specifying Query<User> because the update and delete 
     operations do not return objects of type User. -->
	<% 
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session sess = factory.openSession();
	sess.beginTransaction();
	
	    // Update Query
	    String updateHql = "update User set password1 = :password where id = :id";
	    
	   
	    Query<?> updateQuery = sess.createQuery(updateHql);
	    updateQuery.setParameter("password", "Meka@123");
	    updateQuery.setParameter("id", 5);

	    int rowsUpdated = updateQuery.executeUpdate();
	    if (rowsUpdated > 0) {
	        out.println("Updated " + rowsUpdated + " rows.<br>");
	    }

	    // Delete Query
	    String deleteHql = "delete from User where id = :id";
	    Query<?> deleteQuery = sess.createQuery(deleteHql);
	    deleteQuery.setParameter("id", 3);

	    int rowsDeleted = deleteQuery.executeUpdate();
	    if (rowsDeleted > 0) {
	        out.println("Deleted " + rowsDeleted + " rows.<br>");
	    } else {
	        out.println("<br>No Records Found to Delete<br>");
	    }

	    sess.getTransaction().commit();
	    sess.close();
		 factory.close();
		 %>
		 
</body>
</html>