<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@include file="adminSessionValidate.jsp" %> 
    
    <% 
    	Integer id = Integer.parseInt(request.getParameter("doctorId"));
    	
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("delete from doctor where doctor_id = ?");
    	pstmt.setInt(1, id);
    	
    	int n = pstmt.executeUpdate();
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Processing....</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">


<style type="text/css">
	h1 {
		text-align: center;
		
	
	}
</style>
</head>
<body>
	<%

if (n > 0) {
	out.println("<h2>Successfully Deleted!</h2>");
	response.sendRedirect("adminDeleteDoctor.jsp");
}
%>
</body>
</html>

