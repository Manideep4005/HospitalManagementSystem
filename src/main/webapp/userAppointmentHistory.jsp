<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp" %>
<%
Integer id = (Integer) session.getAttribute("userAccountId");
String userName = (String) session.getAttribute("currentUserName");
%>

<%
Integer userId = 0;

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where user_id = ?");
pstmt.setInt(1, id);

ResultSet rs1 = pstmt.executeQuery();

while (rs1.next()) {
	userId = rs1.getInt("user_id");
}

ResultSet rs2 = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment History | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
* {
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	margin: 0;
	background:  #F7F7F7;
}

.header {
	text-align: center;
	padding: 5px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin-top: 2%;
	font-weight: bolder;
	font-size: 18px;
	color: #34495E;
	text-decoration: underline;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: #f7f7f7;
	box-shadow: 0 0 10px 1px grey;
	/*position: fixed;
    width: 100%;*/
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
	background-color: #BEC3C7;
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
	margin-left: -10px;
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
	height: 38.6px;
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
	padding: 18px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}

.column {
	border: 1px solid red;
	height: auto;
}

.history {
	margin-top: 2%;
}

.patient_details p {
	/*    	margin: 0;*/
	font-size: 20px;
	font-weight: 500;
	padding-left: 20px;
}

.scroll {
	margin-top: 2%;
	overflow-y: auto;
	height: 500px;
}

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 1%;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 10px;
	font-size: 18px;
	border: 1px solid #ccc;
}

h1 {
	text-align: center;
	color: #60FD00;
}

.back p {
	text-align: center;
}

.back a {
	display: inline-block;
	text-align: center;
	text-decoration: underline;
	color: black;
	font-size: 18px;
	cursor: pointer;
	transition: 0.4s ease;
}

.back a:hover {
	text-decoration: underline;
}

@media screen and (max-width: 600px) {
	.scroll {
		height: 480px;
		width: 350px;
		margin-left: auto;
		margin-right: auto;
	}
	
	td, th {
		padding: 10px 5px;
		font-size: 15px;
	}
	
	li a {
		padding: 10px 5px;
	}
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
					<a href="#">My ID: <%=id%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userappointment.jsp">Book Appointment</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="header">
		<p>Appointment History</p>
	</div>


	<div class="scroll">
		<%

		%>



		<!-- <table> <tr class="heading"><th>Appointment ID</th><th>Patient ID</th><th>Patient Name</th>
			<th>Check-up Type</th><th>Appointment Date</th></tr>-->
		<%
		if (userId == 0) {

			out.println("<h1>You haven't booked any Appointments</h1");
		} else {
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Appointment ID</th>");
			out.println("<th>Patient ID</th>");
			out.println("<th>First Name</th>");
			out.println("<th>Last Name</th>");
			out.println("<th>checkup type</th>");
			out.println("<th>Appointment Date</th>");
			out.println("</tr>");
			while (rs2.next()) {
				out.println("<tr>");
				out.println("<td>" + rs2.getInt("appointment_id") + "</td>");
				out.println("<td>" + rs2.getInt("patient_id") + "</td>");
				out.println("<td>" + rs2.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs2.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs2.getString("checkup_type") + "</td>");
				out.println("<td>" + rs2.getDate("appointment_date") + "</td>");
				out.println("</tr>");

			}
			out.println("</table>");
		}
		%>

	</div>

	<div class="back">
		<p>
			<a href="usermodule.jsp">Go Back</a>
		</p>
	</div>


</body>
</html>