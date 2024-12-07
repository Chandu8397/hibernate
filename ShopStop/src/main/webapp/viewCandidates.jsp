<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate List</title>
<style>
h1, h2{
	text-align: center;
	}
</style>
</head>
<body>
<h1>Candidate Details</h1>
	<h2>Data Displayed from MySQL DB using JDBC in Web App</h2>

	<hr>
	<table style="border: 1 width:90%; margin:auto;">
		<tr style="background-color: green">
			<th>Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>DOB</th>
			<th>Phone</th>
			<th>Email</th>
			
		</tr>

		<c:forEach items="${elist}" var="u">
			<tr style="background-color: yellow">
				<td>${u.getId()}</td>
				<td>${u.getFirst_name()}</td>
				<td>${u.getLast_name()}</td>
				<td>${u.getDob()}</td>
				<td>${u.getPhone()}</td>
				<td>${u.getEmail()}</td>
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>