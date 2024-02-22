<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<%
String type = (String) session.getAttribute("specific");

Statement stmt = MySqlConnection.getConnection().createStatement();

int count = 0;

ResultSet rs1 = stmt.executeQuery("select * from doctor");

boolean first = rs1.next();

ResultSet rs2 = stmt.executeQuery("select * from doctor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Doctor | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
body {
	margin: 0;
	background-color: white;
}

* {
	box-sizing: border-box;
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
	border-bottom: 1px ridge gray;
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
	font-weight: 600;
	transition: 0.1s ease;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: #d3d3d3;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: #fff;
	border-radius: 10px;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -10px;
	box-shadow: 0px 8px 16px 0px gainsboro;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 500;
}

.dropdown-content a:hover {
	background-color: lavendar;
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

.dropbtn span:hover, .dropbtn span {
	background-color: lavendar;
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
	font-weight: 1000;
}

.button-icon {
	font-size: 1.2em;
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

.back button {
	margin-top: 2%;
	font-size: 16px;
	border: 2px solid #445454;
	background-color: transparent;
	color: white;
	border-radius: 2px;
	padding: 12px;
	transition-duration: 0.4s;
	cursor: pointer;
	display: block;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	font-weight: 600;
}

.back button:hover {
	background-color: #445454;
	color:white;
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
	.dropdown-content {
		margin-left: -20px;
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
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("currentUserName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("userAccountId")%></a> <a
						href="userdetails.jsp">My Details</a> <a
						href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="scroll">
		<table>
			<%
			if (first == false) {

				out.println("<h1>doctors currently unavailable</h1>");
			} else {
				out.println("<tr>");
				out.println("<th>Prefix</th>");
				out.println("<th>First Name</th>");
				out.println("<th>Last Name</th>");
				out.println("<th>Gender</th>");
				out.println("<th>Education</th>");
				out.println("<th>Specialization</th>");
				out.println("<th>Experience (in years)</th>");
				out.println("</tr>");
				while (rs2.next()) {
					out.println("<tr>");
					out.println("<td>" + "Dr" + "</td>");
					out.println("<td>" +rs2.getString("doctor_firstname") + "</td>");
					out.println("<td>" + rs2.getString("doctor_lastname") + "</td>");
					out.println("<td>" + rs2.getString("gender") + "</td>");
					out.println("<td>" + rs2.getString("education") + "</td>");
					out.println("<td>" + rs2.getString("specialization") + "</td>");
					out.println("<td>" + rs2.getInt("experience") + "</td>");
					out.println("</tr>");

				}
			}
			%>
		</table>
	</div>

	<div class="back">
		<form action="usermodule.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
	</div>
</body>
</html>