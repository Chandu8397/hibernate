<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.hibernate.Session, 
				org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.boot.MetadataSources"%>
<%@ page
	import="org.hibernate.boot.registry.StandardServiceRegistry, 
				org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<%@ page
	import="jakarta.persistence.criteria.CriteriaBuilder, 
				jakarta.persistence.criteria.CriteriaQuery, 
				jakarta.persistence.criteria.Root"%>
<%@ page import="java.util.List"%>
<%@ page import="com.coforge.training.get.hiberweb.Employee"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Criteria Interface Demonstration</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	color: #343a40;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h1 {
	text-align: center;
	color: #007bff;
	margin-bottom: 20px;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 15px;
	text-align: left;
}

th {
	background-color: #007bff;
	color: white;
	text-transform: uppercase;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e9ecef;
}

td {
	font-size: 16px;
}
</style>
</head>

<body>
	<h1>Criteria Interface Demonstration</h1>
	<%
        // Hibernate 6 Configuration
        StandardServiceRegistry registry = null;
        SessionFactory sessionFactory = null;
        Session hibernateSession = null;
        List<Employee> employees = null;

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

            CriteriaBuilder cb = hibernateSession.getCriteriaBuilder();
            
            // Fetch all records
            CriteriaQuery<Employee> cqAll = cb.createQuery(Employee.class);
            Root<Employee> rootAll = cqAll.from(Employee.class);
            cqAll.select(rootAll);
            employees = hibernateSession.createQuery(cqAll).getResultList();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<%
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<%
            }
        %>
	</table>

	<h2>Employees with Salary between 4000 and 8000</h2>
	<%
            // Example of 'between' operator: Salary between 40000 and 80000
            CriteriaQuery<Employee> cqBetween = cb.createQuery(Employee.class);
            Root<Employee> rootBetween = cqBetween.from(Employee.class);
            cqBetween.select(rootBetween).where(cb.between(rootBetween.get("salary"), 4000, 8000));
            employees = hibernateSession.createQuery(cqBetween).getResultList();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<%
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<%
            }
        %>
	</table>

	<h2>Employees in HR, IT, Sales Departments</h2>
	<%
            // Example of 'in' operator: Department in ('HR', 'IT', 'Sales')
            CriteriaQuery<Employee> cqIn = cb.createQuery(Employee.class);
            Root<Employee> rootIn = cqIn.from(Employee.class);
            cqIn.select(rootIn).where(rootIn.get("department").in("HR", "IT", "Sales"));
            employees = hibernateSession.createQuery(cqIn).getResultList();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<%
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<%
            }
        %>
	</table>

	<h2>Employees with Logical Conditions</h2>
	<%
            // Example of logical operators: (Salary > 8000 AND Department = 'IT') OR (Salary < 4000 AND Department = 'HR')
            CriteriaQuery<Employee> cqLogical = cb.createQuery(Employee.class);
            Root<Employee> rootLogical = cqLogical.from(Employee.class);
            cqLogical.select(rootLogical).where(
                cb.or(
                    cb.and(
                        cb.greaterThan(rootLogical.get("salary"), 8000),
                        cb.equal(rootLogical.get("department"), "IT")
                    ),
                    cb.and(
                        cb.lessThan(rootLogical.get("salary"), 4000),
                        cb.equal(rootLogical.get("department"), "HR")
                    )
                )
            );
            employees = hibernateSession.createQuery(cqLogical).getResultList();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<%
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<%
            }
        %>
	</table>
	<h2>Employees with Salary Greater than 10000</h2>
	<%
    CriteriaBuilder cb1 = hibernateSession.getCriteriaBuilder();
	
    // Example of greaterThan: Salary greater than 10000 
    CriteriaQuery<Employee> cqGreaterThan = cb1.createQuery(Employee.class); 
    Root<Employee> rootGreaterThan = cqGreaterThan.from(Employee.class); 
    cqGreaterThan.select(rootGreaterThan).where(cb1.greaterThan(rootGreaterThan.get("salary"), 10000)); 
    employees = hibernateSession.createQuery(cqGreaterThan).getResultList();
    %>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<% if (employees != null && !employees.isEmpty()) { 
		for (Employee emp : employees) 
		{ %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<% } } 
	else { %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<% } %>
	</table>

	<% // Example of like: Employees whose names start with 'S' 
	CriteriaQuery<Employee> cqStartsWithS = cb.createQuery(Employee.class); 
	Root<Employee> rootStartsWithS = cqStartsWithS.from(Employee.class); 
	cqStartsWithS.select(rootStartsWithS).where(cb.like(rootStartsWithS.get("name"), "S%")); 
	employees = hibernateSession.createQuery(cqStartsWithS).getResultList(); 
	%>
	<h2>Employees whose Names Start with 'S'</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>
		<% if (employees != null && !employees.isEmpty()) { 
		for (Employee emp : employees) { %>
		<tr>
			<td><%= emp.getId() %></td>
			<td><%= emp.getName() %></td>
			<td><%= emp.getDepartment() %></td>
			<td><%= emp.getSalary() %></td>
		</tr>
		<% } } 
		else { %>
		<tr>
			<td colspan="4" style="text-align: center;">No employees found</td>
		</tr>
		<% } %>
		<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (hibernateSession != null) hibernateSession.close();
            if (sessionFactory != null) sessionFactory.close();
            if (registry != null) StandardServiceRegistryBuilder.destroy(registry); // Destroy registry
        }
    %>
	
</body>
</html>