<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.admin.DoctorsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

<%@include file="doctorSessionValidate.jsp"%>


<%


String doctorFirstName = "";
String doctorLastName = "";
String specialization = "";

Integer doctorId = (Integer)session.getAttribute("doctorSessionId");

DoctorsBean dBean = new DoctorsBean();

ArrayList<DoctorsBean> dlist = dBean.getDoctorById(doctorId);

Iterator<DoctorsBean> itr = dlist.iterator();

while (itr.hasNext()) {
	dBean = itr.next();
	
	doctorFirstName = dBean.getDoctorFirstName();
	doctorLastName = dBean.getDoctorLastName();
	specialization = dBean.getSpecialization();
}


session.setAttribute("doctorLogoutName", doctorFirstName + " " + doctorLastName);
session.setAttribute("doctorAccountName", doctorFirstName + " " + doctorLastName);
session.setAttribute("doctorAccountId", new Integer(doctorId));
session.setAttribute("doctorSpecialization", specialization);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome | Hospital Management System</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
@charset "ISO-8859-1";

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background-color: white;
}


.topnav p {
	text-align: center;
	margin: 0;
	font-weight: 600;
	font-size: 20px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	box-shadow: 0 2px 5px gray;
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
	transition: 0.5s ease;
	font-weight: bolder;
	font-family: 'Poppins', sans-serif;
}

li a:hover, .dropdown:hover {
	background-color: #778899;
	color: white;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #C9C9BC;
	min-width: 160px;
	margin-left: -21px;
	box-shadow: 0 1px 5px black;
	transition: 0.34s ease;
	border-radius: 1px;
	z-index: 1;
	text-align: left;
}

.dropdown-content:hover {
	
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 600;
	transition: 0.34s ease;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #fffff7;
	color: black;
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
	font-weight: 600;
}

.dropbtn span:hover, .dropbtn span {
	font-weight: bolder;
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
}

.button-icon {
	font-size: 1.5em;
}

.doctor_view {
	width: 300px;
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 0 0 10px #38ef7d;
	border-radius: 10px;
}

.doctor_view p {
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	color: black;
	margin-top: 20%;
	
}

form {
	box-shadow: 0px 0px 10px #A3A398;
	width: 200px;
	height: 200px;
	margin: auto;
	padding: 15px;
	border-radius: 15px;
	transition: 0.34s;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

form:hover {
	box-shadow: 0px 0px 10px 1px #38ef7d;
}

button {
	display: block;
	margin: 8px 0;
	margin-left: auto;
	margin-right: auto;
	border: 2px solid #38ef7d;
	padding: 8px 10px;
	width: 80%;
	cursor: pointer;
	transition: 0.34s;
	border-radius: 5px;
	font-size: 18px;
	background-color: #38ef7d;
	font-weight: 600;
	color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

button:hover {
	background: white;
	border-color: #38ef7d;
	color: #38ef7d;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.button-icon {
		font-size: 1em;
	}
	.button-text, .button-icon {
		padding: 5px;
		height: 100%;
	}
	
	.dropdown-content {
		min-width: 100px;
		margin-left: -10px;
	}
	
	.topnav p {
		display: none;
	}
}
</style>
</head>
<body>
	

	<div class="topnav">
		
		<ul>
			<p>Hospital Management System</p>
			<li><a href="doctormodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text">Dr. <%=doctorFirstName + " " + doctorLastName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=doctorId%></a> <a href="doctordetails.jsp">My
						Account</a> <a href="LogoutDoctorServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="doctor_view">

		<form action="doctorViewAppointment.jsp" method="post">
			<p>Appointments</p>
			<button type="submit">View</button>
		</form>
	</div>


</body>
</html>