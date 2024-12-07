<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Net Salary of Employees</title>
<link rel="stylesheet" href="CSS/Style.css">
</head>
<body>
	 <div class="form-container">
	 <h1>Shop Stop Net Salary of Employees</h1>
	 <%
	 String name = request.getParameter("empname");
	 float gross = (Float) request.getAttribute("gr");
	 float deduction = gross * 0.05f; 
     float net = gross - deduction;
	 %>
	 <hr>
        <h2>Net Salary</h2>
        <p><strong>Employee Name:</strong> <%=name%> </p>
        <p><strong>Basic:</strong> ${b}</p>
        <p><strong>DA:</strong> ${da}</p>
        <p><strong>HRA:</strong> ${hra}</p>
        <p><strong>Gross:</strong> <%=gross %></p>
        <p><strong>Deductions:</strong> <%=deduction %></p>
        <hr>
         <p><strong>Net Salary:</strong> <%=net %></p>
         <hr>
    </div>
	
</body>
</html>