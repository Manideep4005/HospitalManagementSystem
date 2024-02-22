<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments Page | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<style type="text/css">
body {
	margin: 0;
	background-color: white;
	font-family: 'Poppins', sans-serif;
}

* {
	box-sizing: border-box;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1px solid gray;
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
	font-weight: 700;
	transition-duration: 0.4s;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: white;
	border-radius: 8px;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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
	height: 36.6px;
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
	font-size: 1.2em;
}



.nav {
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid grey;
}

.nav .login-container {
	float: right;
}

.nav p {
	margin-top: 0;
	float: left;
	display: inline-block;
	color: black;
	text-align: center;
	padding: 0px 14px;
	text-decoration: none;
	font-size: 15px;
	font-weight: 1000;
	padding-top: 13px;
}

input:focus {
	box-shadow: 0px 0px 5px 1px #317AC7;
	border: none;
}

input:hover {
	box-shadow: 0px 0px 8px 1px #317AC7;
	border: none;
}

input {
	border: none;
	width: 50%;
	padding: 10px 5px;
	margin: 8px 0;
	margin-bottom: 15px;
	display: block;
	box-shadow: 0px 0px 0px 1px #317AC7;
	border-radius: 5px;
	box-sizing: border-box;
	outline: none;
	background-color: transparent;
	margin-right: auto;
	margin-left: auto;
	font-size: 15px;
	width: 120px;
	transition: .34s ease;
}

select option {
	background: white;
	color: black;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
}

input::placeholder {
	font-weight: bold;
	opacity: 0.6;
	font-size: 12px;
}

button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid transparent;
	padding: 10px 5px;
	width: 80px;
	border-radius: 5px;
	background-color: #9cb2ce;
	cursor: pointer;
	font-weight: bold;
	transition: 0.35s ease;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

.list form {
	margin-left: auto;
	margin-right: auto;
	border: 0px solid transparent;
	padding: 10px 5px 12px 5px;
	margin-top: 3%;
	width: 500px;
	border-radius: 10px;
	box-shadow: 0px 0px 5px 2px grey;
	transition: .34s ease;
}

.list form:hover {
	box-shadow: 0px 0px 5px 2px blue;
}

.list p {
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
}

#back {
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

#back:hover {
	text-decoration: underline;
}


 

@media screen and (max-width:600px) {

	.list form {
		width: 320px;
	
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
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("adminName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("adminAccountId")%></a>
					<a href="admindetails.jsp">My Details</a> <a
						href="/HMS/AdminDisplayAllDoctors">Doctors list</a> <a
						href="adminViewPatients.jsp">Patient List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="list">
		<div class="app1">

			<form action="adminViewAppointmentOnDate.jsp" method="post"
				style="margin-top: 4%;">

				<p>Search Appointment</p>
				<input type="date" name="appdate" value="yyyy/mm/dd"
					required="required">
				<button type="submit">Search</button>
			</form>
		</div>

		<div class="app2">

			<form action="adminAppointmentDetails.jsp" method="post">
				<p>All Appointments</p>
				<button type="submit">View</button>
			</form>
		</div>

		<div class="app3">

			<form action="adminCurrentAppointments.jsp">
				<p>Today Appointments</p>
				<button type="submit">View</button>
			</form>
		</div>
	</div>


	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>


</body>
</html>