<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>

<%@include file="adminSessionValidate.jsp"%>




<%

Integer adminId = (Integer)session.getAttribute("adminValidateId");
// JDBC CODE TO GET USER NAME
PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select admin_firstname, admin_lastname, admin_id, email from admin where admin_id = ?");
pstmt.setInt(1, adminId);

Integer aId = 0;
String adminFirstName = "";
String adminLastName = "";
String email = "";
ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	aId = rs.getInt("admin_id");
	adminFirstName = rs.getString("admin_firstname");
	adminLastName = rs.getString("admin_lastname");
	email = rs.getString("email");
}

session.setAttribute("adminEmail", email);
session.setAttribute("adminLogoutName", adminFirstName + " " + adminLastName);
session.setAttribute("adminAccountId", new Integer(aId));
session.setAttribute("adminName", adminFirstName + " " + adminLastName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Welcome | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	/*background-image: linear-gradient(to right, #eacda3 , #d6ae7b);*/
	background-color: white;
}

.header {
	background: white;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	text-align: center;
}

.topnav {
	position: sticky;
	top: -1px;
	backdrop-filter: blur(10px);
	box-shadow: 0px 0px 10px 0px grey;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: white;
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
	padding: 12px 16px;
	text-decoration: none;
	font-weight: 600;
	transition-duration: 0.4s;
}

li a:hover, .dropdown:hover {
	background-color: dodgerblue;
	color: white;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	margin-left: -40px;
	box-shadow: 0px 8px 16px 0px #008cba;
	border-radius: 10px;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 300;
	font-weight: bold;
}

.dropdown-content a:hover {
	background-color: dodgerblue;
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
	font-weight: 1000;
	transition: 0.3s;
}

.dropbtn span:hover {
	font-weight: 1000;
	color: white;
}

.dropbtn span {
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

.container {
	display: grid;
	grid-template-columns: auto auto;
	align-content: center;
	justify-content: space-evenly;
	transition-duration: 0.4s;
	gap: 50px;
	padding: 20px;
	margin-top: 20px;
}

.item {
	width: 400px;
	padding: 20px;
	text-align: center;
	box-shadow: 0 0 15px dodgerblue;
	border-radius: 10px;
	transition-duration: 0.4s;
	border: 2px solid transparent;
	animation: shape 5s infinite;
}

.item:hover {
	box-shadow: 0 0 0 1px #008cba, 0 0 10px dodgerblue;
	animation: none;
}

.item p {
	font-size: 18px;
	font-weight: 700;
}

.item button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	padding: 12px;
	border: 2px solid #008cba;
	background-color: #008cba;
	color: white;
	font-weight: 700;
	font-size: 17px;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: 0.4s;
}

.item button:hover {
	border: 2px solid dodgerblue;
	background-color: white;
	color: black;
}

@keyframes shape { 50% {
	border-radius: 10px;
	border-color: #008CBA;
	box-shadow: none;
}

}
@media screen and (max-width: 1000px) {
	.container {
		grid-template-columns: auto;
		gap: 80px;
	}
}

@media screen and (max-width: 600px) {
	.container {
		grid-template-columns: auto;
		gap: 45px;
	}
	.item {
		width: 300px;
	}
	li a {
		padding: 10px 5px;
		font-size: 15px;
	}
	.header {
		display: none;
	}
	.dropdown-content {
		margin-left: -10px;
		min-width: 100px;
	}
}
</style>



</head>
<body>

	<div class="topnav">

		<div class="header">
			<p>Welcome Hospital Management System</p>
		</div>
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png" /></span> <span class="button-text"><%=adminFirstName + " " + adminLastName%></span>
			</a>

				<div class="dropdown-content">
					<a href="#">My ID: <%=adminId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="container">
		<div class="item" >
			<p>Doctors List</p>
			<form action="DisplayAllDoctorsServlet" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Admins & Users</p>
			<form action="adminAdministration.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Patients List</p>
			<form action="adminPatientList.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Appointments</p>
			<form action="adminAppointmentPage.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Register Doctor</p>
			<form action="doctorregister.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Delete Doctor</p>
			<form action="adminDeleteDoctor.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Search Patient</p>
			<form action="adminSearchPatient.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Patient Details</p>
			<form action="adminGetPatient.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>
	</div>
</body>
</html>
