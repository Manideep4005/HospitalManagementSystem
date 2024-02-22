<%@page import="java.time.Instant"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String id = (String) session.getAttribute("userSessionId");
%>

<%
String firstName = "";
String lastName = "";
String password = "";
String email = "";
String gender = "";
String address = "";
long contact = 0;
Date join_date = null;
Timestamp stamp = null;

PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from user where userid = ?");
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();



SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

SimpleDateFormat formatter2 = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");



while (rs.next()) {
	firstName = rs.getString("first_name");
	lastName = rs.getString("last_name");
	password = rs.getString("password");
	email = rs.getString("email");
	gender = rs.getString("gender");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	join_date = rs.getDate("join_date");
	stamp = rs.getTimestamp("passwordchangedate");
}

String passwordChangeDate;
if (stamp != null) {
	passwordChangeDate = formatter2.format(stamp);
} else {
	passwordChangeDate = " ";
}

String joined_date = formatter.format(join_date);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	/* background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
	font-family: 'Poppins', sans-serif;
}



ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1.8px solid gainsboro;
	box-shadow: 0 0 5px 1px gainsboro;
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 10px 16px;
	text-decoration: none;
	font-weight: bold;
	transition: 0.1s ease;
	font-weight: 700;
}

li a:hover, .dropdown:hover {
	background-color: #d3d3d3;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -80px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 450;
}

.dropdown-content a:hover {
	background-color: #778899;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 36.6px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
	font-weight: 300;
}

.dropbtn span {
	font-weight: 1000;
	color: black;
}

a img {
	height: auto;
	width: 1.2em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 20px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}



.details {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1%;
	box-shadow: 0px 0px 10px 1px gainsboro;
	border-radius: 5px;
}

th, td {
	font-size: 20px;
	padding: 10px 15px;
	text-align: left;
}


@media screen and (max-width:600px) {
	.details {
		width: 320px;
		padding: 10px;
	}
	
	table {
		padding: 1px;
	}
	
	li a {
		padding: 10px 5px;
	}
	
	.dropdown-content {
	
		margin-left: -20px;
	}
	
	th, td {
		font-size: 15px;
		padding: 10px 5px;
	}
	
 
}

.btns {
	width: 300px;
	margin: 20px auto 30px auto;
	padding: 10px 10px;
	border-radius: 20px;
	box-shadow: 0 0 5px #809080;
}

.btns a {
	margin-left: 15px;
	text-decoration: none;
	color: dodgerblue;
	font-weight: 500;
	transition-duration: .4s;
}

.btns a:hover {
	color: #168aaa;
	text-decoration: underline;
}

#message {
	color: green;
	text-align: center;
}

</style>


</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=firstName + " " + lastName%></span>
			</a>


				<div class="dropdown-content">
					<a href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>
	
	

	<div class="btns">
		<a href="user-updateprofile.jsp">Update Profile</a>
		<a href="userChangePassword.jsp">Update Password</a>
	</div>
	
	
	
	<c:if test="${passwordChangeSuccessUser != null }">
		<p id="message">${passwordChangeSuccessUser }</p>
	</c:if> 
	
	<c:if test="${userUpdateSucess != null }">
		<p id="message">${userUpdateSucess }</p>
	</c:if> 
	
	<div class="details">
		<table>
			<tr>
				<th>ID:</th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th>First Name:</th>
				<td><%=firstName%></td>
			</tr>

			<tr>
				<th>Last Name:</th>
				<td><%=lastName%></td>
			</tr>

			<tr>
				<th>Email:</th>
				<td><%=email%></td>
			</tr>

			<tr>
				<th>Password:</th>
				<td><%=password%> <span><%=passwordChangeDate%></span></td>
			</tr>

			<tr>
				<th>Gender:</th>
				<td><%=gender%></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td><%=address%></td>
			</tr>
			<tr>
				<th>Contact:</th>
				<td><%=contact%></td>
			</tr>
			<tr>
				<th>Joined Date:</th>
				<td><%=joined_date%></td>
			</tr>

		</table>
	</div>

	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('message');
		get.style.display = 'none';
		}, 6000);
	</script>

</body>
</html>

<%session.removeAttribute("passwordChangeSuccessUser");
session.removeAttribute("userUpdateSucess");%>
