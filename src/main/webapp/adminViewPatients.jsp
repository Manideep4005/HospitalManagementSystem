<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<%
Integer userId = (Integer) session.getAttribute("adminAccountId");
String adminName = (String) session.getAttribute("adminName");

Statement stmt = MySqlConnection.getConnection().createStatement();
ResultSet rs = stmt.executeQuery("select * from patient");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Patients List | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />


<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	background-color: white;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: auto;
	background-color: white;
	border-bottom: 1px solid #a8a8a8;
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
	font-weight: 300;
	transition: 0.1s ease;
	border-radius: 5px;
	font-weight: 1000;
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
	border-radius: 8px;
	margin-left: -90px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 300;
}

.dropdown-content a:hover {
	background-color: #778899;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 38px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
	font-weight: 1000;
}

.dropbtn span:hover, .dropbtn span {
	font-weight: 1000;
	color: black;
}

a img {
	height: auto;
	width: 1em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 1px 5px;
	color: white;
	height: 100%;
	font-weight: 1000;
}

.button-icon {
	font-size: 1.5em;
}

.scroll {
	margin-top: 1%;
	overflow-y: auto;
	height: 500px;
	padding: 5px;
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
	font-size: 16px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -5px;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 10px;
	font-size: 16px;
	border: 1px solid #ccc;
}

h1 {
	text-align: center;
	color: #60FD00;
}

@media screen and (max-width:600px) {
	.scroll {
		height: 450px;
	}
	td, th {
		font-size: 14px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	input {
		margin-left: 10px;
		padding: 10px 5px;
	}
}


.nav {
	padding: 10px;
}

.nav .form {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

input {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 2px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

input:focus {
	box-shadow: 0 0 0 2px dodgerblue;
	border-color: transparent;
}

.nav button {
	border: none;
	display: inline-block;
	margin: 0;
	padding: 10px 15px;
	border-radius: 3px;
	width: 30%;
	border: 2px solid dodgerblue;
	background-color: white;
	font-size: 15px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.nav button:hover {
	border-color: transparent;
	background-color: #008cba;
	color: white;
}

#demo {
	color: red;
	text-align: center;
	margin: 0;
}

.back button {
	color: black;
	border: none;
	background-color: transparent;
	font-size: 17px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5%;
	font-weight: bolder;
	cursor: pointer;
	text-decoration: none;
	transition: 0.34s ease;
}

.back button:hover {
	text-decoration: underline;
}

#userId {
	color: dodgerblue;
	text-decoration: none;
}
</style>

</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=adminName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="adminAppointmentDetails.jsp">Appointment
						Details</a> <a href="adminPatientsDepartmentView.jsp">Patient
						Department wise</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>
	
	<!--  <div class="patient_view">
	<table>
		<tr>
			<th>Patient Id</th>
			<th>Patient Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Check-up</th>
			<th>Symptoms</th>
			<th>Email</th>
			<th>Address</th>
			<th>Contact</th>
			<th>Appointment date</th>
			<th>User Id</th>
			
		</tr>
		
/*while (rs.next()) {
	out.println("<tr>");
	out.println("<td>" + rs.getInt("patient_id") + "</td>");
	out.println("<td>" + rs.getString("patient_name") + "</td>");
	out.println("<td>" + rs.getString("gender") + "</td>");
	out.println("<td>" + rs.getInt("age") + "</td>");
	out.println("<td>" + rs.getString("checkup_type") + "</td>");
	out.println("<td>" + rs.getString("symptoms") + "</td>");
	out.println("<td>" + rs.getString("email") + "</td>");
	out.println("<td>" + rs.getString("address") + "</td>");
	out.println("<td>" + rs.getLong("contact") + "</td>");
	out.println("<td>" + rs.getTimestamp("admitted_date") + "</td>");
	out.println("<td>" + rs.getInt("user_id") + "</td>");
	out.println("</tr>");
}*/
		%>
	</table>
</div>-->

	<div class="scroll">
		<table>
			<tr>
				<th>Patient Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Check-up</th>
				<th>Symptoms</th>
				<th>Email</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Appointment date</th>
				<th>User Id</th>

			</tr>

			<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td><a id=\"userId\" href=\"adminViewPatientDetails.jsp?id=" + rs.getInt("patient_id") + "\">"
						+ rs.getInt("patient_id") + "</a></td>");
				out.println("<td>" + rs.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs.getString("gender") + "</td>");
				out.println("<td>" + rs.getInt("age") + "</td>");
				out.println("<td>" + rs.getString("checkup_type") + "</td>");
				out.println("<td>" + rs.getString("symptoms") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("address") + "</td>");
				out.println("<td>" + rs.getLong("contact") + "</td>");
				out.println("<td>" + rs.getTimestamp("admitted_date") + "</td>");
				out.println("<td>" + rs.getInt("user_id") + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
	</div>

	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>
	
	
	
	
	<script type="text/javascript">
		function validateForm() {

			var y = document.getElementById("one").value;

			if (isNaN(y)) {
				document.getElementById("demo").innerHTML = "Enter Numbers Only.";
				return false;
			} else if (y.length == "" || y.length < 5) {
				document.getElementById("demo").innerHTML = "Please Enter 5 Digit Id";
				return false;
			} else {
				return true;
			}

		}
	</script>
	
</body>
</html>