<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@ page
	import="org.hibernate.boot.registry.StandardServiceRegistry,
				org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<%@ page
	import="jakarta.persistence.criteria.CriteriaBuilder,
				jakarta.persistence.criteria.CriteriaQuery,
				jakarta.persistence.criteria.Root"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.boot.MetadataSources"%>
<%@ page import="com.coforge.training.assignments.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<style>
table {
	border-collapse: collapse;
	width: 60%;
	margin: 20px auto;
}
 
th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}
 
th {
	background-color:pink;
}
 
h1 {
	text-align: center;
	color: blue;
}
</style>
</head>
<body>
 
	<h1>Employee List</h1>
	<%
        // Hibernate 6 Configuration
        StandardServiceRegistry registry = null;
        SessionFactory sessionFactory = null;
        Session hibernateSession = null;
        List<Book> book = null;
 
        try {
            // Initialize the ServiceRegistry
            registry = new StandardServiceRegistryBuilder()
                        .configure("hibernate.cfg.xml") // Load configuration
                        .build();
 
            // Build the SessionFactory
            sessionFactory = new MetadataSources(registry)
                             .buildMetadata()
                             .getSessionFactoryBuilder()
                             .build();
 
            // Open a session and fetch Employee records
            hibernateSession = sessionFactory.openSession();
 
            // Using Criteria API
            CriteriaBuilder cb = hibernateSession.getCriteriaBuilder();
            CriteriaQuery<Book> cq = cb.createQuery(Book.class);
            Root<Book> root = cq.from(Book.class);
 
            cq.select(root); // Fetch all records
            book = hibernateSession.createQuery(cq).getResultList();
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (hibernateSession != null) hibernateSession.close();
            if (sessionFactory != null) sessionFactory.close();
            if (registry != null) StandardServiceRegistryBuilder.destroy(registry); // Destroy registry
        }
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Publisher</th>
			<th>Quantity</th>
			
		</tr>
		<%
            if (book != null && !book.isEmpty()) {
                for (Book b : book) {
        %>
		<tr>
			<td><%= b.getId() %></td>
			<td><%= b.getTitle() %></td>
			<td><%= b.getAuthor() %></td>
			<td><%= b.getPublisher() %></td>
			<td><%= b.getQuantity() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="4" style="text-align: center;">No Book found</td>
		</tr>
		<%
            }
        %>
	</table>
</body>
</html>