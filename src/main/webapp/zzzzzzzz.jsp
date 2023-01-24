<%@page import="java.sql.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <% String date1 = request.getParameter("date");
		Date date = Date.valueOf(date1);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1><%= date %><%=date1 %></h1>
</body>
</html>