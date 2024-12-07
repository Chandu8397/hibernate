<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java in JSP</title>
</head>
<body>
<h1> Dynamic Content Generation using Java in JSP - Demo</h1>
	
	<h2><%= "Welcome To JSP" %></h2> <!-- Expressions -->
	<h2><%= 2+4/10 %></h2>
	
	<!-- Scriptlet -->
	<%                          
	   int a=20,b=30,c=10;
		out.println(a+b+c);
	%>
	
	<h2> The Addition of 3 Numbers is : <%= a+b+c %></h2>
	
	<h3> The Current Times is :<%= java.time.LocalTime.now() %></h3>
	
	
	<!--  Declaration tag in jsp -->
	<%!
		public long fact (long x) 
		{
		if (x == 0) return 1;
		else 
			return x * fact(x-1);
		} 
	%>
	<h3> The Factorial of a Number is : <%=fact(5) %></h3>
	
	<h3> Display nos from 1-10</h3>
	<%
		for(int i=1;i<=10;i++)
		{
			out.print(i +" Raj<br>" );
		}
	%>
	
	<h1>Mathematical functions</h1>
        <b>Value of PI : </b><%=Math.PI %><br />
        <b>Exponential Value of 10 : </b><%=Math.exp(10) %><br />
        <b>floor 3.14 : </b><%=Math.floor(3.14) %><br />
        <b>ceil 3.14 : </b><%=Math.ceil(3.14) %><br />
        <b>log 10 : </b><%=Math.log(10) %><br />
        <b>max 10,11 : </b><%=Math.max(10,11) %><br />
        <b>min 10,11 : </b><%=Math.min(10,11) %><br />
</body>
</html>