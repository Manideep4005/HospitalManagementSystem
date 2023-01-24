<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
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
</head>
<body>
	<script type="text/javascript">
		alert('sucessfully delete doctor with ID:- ' + id);
	</script>
</body>
</html>

<%

if (n > 0) {
	response.sendRedirect("adminDeleteDoctor.jsp");
}
%>