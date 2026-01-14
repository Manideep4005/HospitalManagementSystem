<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>

<%
Integer id = (Integer) session.getAttribute("userAccountId");
String userName = (String) session.getAttribute("currentUserName");
%>

<%
PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from user where userid = ?");
pstmt.setInt(1, id);

ResultSet rs = pstmt.executeQuery();
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
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	/* background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
}

.header {
	text-align: center;
	padding: 5px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin: 0;
	font-weight: bold;
	font-size: 18px;
	color: black;
	text-decoration: underline;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1.8px solid gray;
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
	font-weight: 600;
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
	margin-left: -20px;
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
	font-weight: 1000;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}

.column {
	float: left;
	/*      width: 33.33%;*/
	padding: 0px 15px 0px 15px;
	border: 1px solid red;
}

.column.side {
	width: 25%;
}

.column.middle {
	width: 50%;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

@media screen and (max-width:600px) {
	.column {
		width: 100%;
	}
}

.change_password button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	padding: 12px 20px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #008CBA;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
}

.change_password button:hover {
	background-color: #008cba;
	color: white;
}

p {
	text-align: center;
	font-weight: bolder;
	font-size: 20px;
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
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="details">
		<%
		while (rs.next()) {
			out.println("<p>User Id:-  " + id + "</p>");
			out.println("<p>Password:-   " + rs.getString("password") + "</p>");
		}
		%>
	</div>

	<div class="change_password">
		<form method="post" action="userdetails.jsp">
			<button type="submit">Back</button>
		</form>
	</div>

</body>
</html>
