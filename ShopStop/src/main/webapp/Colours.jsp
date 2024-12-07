<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Embedding Java Code in JSP</title>

<!-- Java Declaration -->
<%!
	String[] names={"Khaki","Aqua","GreenYellow",
			"Crimson","OrangeRed","Yellow","Pink","red"};;
%>
</head>
<body>
	<h1 style="text-align: center;"> List of Colours </h1>
	
	<table border="1"; style="margin: auto;">
		<th>Name</th>
		<!--Java Declaration -->
		<%
			for(int i=0; i<names.length;i++)
			{
		%>	
			
			<tr>
			<!-- Java Expression -->
			<td bgcolor="<%=names[i] %>" width="200"> <%=names[i] %></td>
			</tr>
			<%
			}
			%>
			</table>
	

</body>
</html>