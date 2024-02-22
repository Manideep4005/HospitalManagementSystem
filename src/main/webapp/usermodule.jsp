<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<%
String userId = (String) session.getAttribute("userSessionId");
%>

<%
// JDBC CODE TO GET USER NAME
PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select first_name,last_name,userid,email from user where userid = ?");
pstmt.setString(1, userId);

Integer uId = 0;
String userFirstName = "";
String userLastName = "";
String userEmail = "";

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	uId = rs.getInt("userid");
	userFirstName = rs.getString("first_name");
	userLastName = rs.getString("last_name");
	userEmail = rs.getString("email");
}

String userName = userFirstName + " " + userLastName;

session.setAttribute("userLogoutName", userFirstName + " " + userLastName);
session.setAttribute("currentUserName", userFirstName + " " + userLastName);
session.setAttribute("userAccountId", new Integer(uId));
session.setAttribute("userEmail", userEmail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mani Hospitals | A way to Better Life</title>
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
	background-color: white;
}

.topnav {
	background-color: white;
	color: black;
	text-align: center;
	height: auto;
	margin: 0px;
	box-shadow: 0 0 5px black;
}

.topnav p {
	padding: 10px 0px;
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	color: black;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 5px;
	overflow: hidden;

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
	font-weight: 600;
	transition: 0.1s ease;
	transition: 0.4s ease;
}

li a:hover, .dropdown:hover {
	background-color: #a8a8a8;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	margin-left: -2px;
	box-shadow: 0px 8px 16px 0px #09203F;
	z-index: 1;
	border-radius: 1px;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: bold;
	transition: 0.1s;
	font-size: 14px;
}

.dropdown-content a:hover {
	background-color: #a8a8a8;
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
	height: 100%;
}

.button-text {
	font-weight: 1000;
}

.button-icon {
	font-size: 1.3em;
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

.intro {
	padding: 10px;
	margin-top: 1%;
	padding-left: 15px;
	margin-left: 1%;
	margin-right: 1%;
	border-radius: 2%;
	box-shadow: 0px 0px 5px 0px #537895;
}

.intro p {
	color: black;
	font-weight: 500;
	font-size: 20px;
}

select:focus {
	border: 2px solid #317AC7;
	box-shadow: none;
}

select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border: 2px solid transparent;
	box-shadow: 0px 0px 5px 0px midnightblue;
	border-radius: 5px;
	box-sizing: border-box;
	outline: none;
	background-color: transparent;
	transition: 0.34s ease;
	margin-left: auto;
	margin-right: auto;
}

select option {
	background: white;
	color: black;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
}

.doctor_view, .book {
	box-shadow: 0px 0px 5px 0px #09203F;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
	padding: 15px 20px;
	border-radius: 2%;
	width: 500px;
	text-align: center;
	transition: 0.34s ease;
	background-image: none;
}

.doctor_view form, .book form {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}

.book {
	padding: 25px;
}

.doctor_view:hover, .book:hover {
	box-shadow: 0px 0px 5px 2px #09203F;
}

.doctor_view p {
	font-size: 20px;
	font-weight: 600;
}

.book p {
	font-size: 20px;
	font-weight: 600;
	text-align: center;
}

.book button {
	border: none;
	background-color: #a8a8a8;
	color: black;
	padding: 10px 15px;
	border-radius: 2px;
	width: 50%;
	cursor: pointer;
	transition: 0.34s ease;
	font-size: 16px;
	font-weight: 600;
}

.book button:hover {
	background-color: #537895;
	color: white;
	transform: scale(1.25);
}

.doctor_view button {
	border: none;
	background-color: #a8a8a8;
	color: black;
	padding: 10px 15px;
	border-radius: 2px;
	width: 50%;
	cursor: pointer;
	transition: 0.34s ease;
	display: block;
	margin-left: auto;
	margin-right: auto;
	font-size: 16px;
	font-weight: 600;
}

.doctor_view button:hover {
	background-color: #537895;
	color: white;
	transform: scale(1.25);
}

@media screen and (max-width: 600px) {
	.book, .doctor_view {
		width: 320px;
	}
	.book form, .doctor_view form {
		width: 300px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		min-width: 160px;
		margin-left: -15px;
	}
	
	.topnav p {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="header"></div>

	<div class="topnav">
		<p>Welcome To Hospital Management System</p>
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userAppointmentHistory.jsp">Appointment
						History</a> <a href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="doctor_view">
		<p>Find A Doctor</p>
		<form method="post" action="UserViewDoctorServlet">
			<select required name="doctorview">
				<option value="all">All</option>
				<option value="general physician">General Physician</option>
				<option value="cardiologist">Cardiologist</option>
				<option value="dermetalogist">Dermatologist</option>
				<option value="orthopedic">Orthopedic</option>
				<option value="gastroenterologist">Gatroenterologist</option>
				<option value="diabetic">Diabetics</option>
				<option value="anesthesiologists">Anesthesiologists</option>
				<option value="neurologists">Neurologists</option>
				<option value="pediatric">Pediatric</option>
				<option value="pulmonologist">Pulmonologist</option>
				<option value="urologist">Urologist</option>
			</select> &nbsp;&nbsp;&nbsp;<span><button type="submit">View</button></span>

		</form>
	</div>

	<div class="book">
		<p>Consult A Doctor</p>
		<form action="userappointment.jsp" method="post">
			<button type="submit">Book</button>
		</form>
	</div>

</body>
</html>