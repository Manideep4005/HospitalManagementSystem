<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Integer pId = Integer.parseInt(request.getParameter("id"));
PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where patient_id=?");
pstmt.setInt(1, pId);

ResultSet rs = pstmt.executeQuery();

int patientId = 0;
String patientFirstName = "";
String patientLastName = "";
String gender = "";
int age = 0;
String checkup_type = "";
String symptoms = "";
String email = "";
String address = "";
long contact = 0;
Timestamp join_date = null;
int user_id = 0;

while (rs.next()) {
	patientId = rs.getInt("patient_id");
	patientFirstName = rs.getString("patient_firstname");
	patientLastName = rs.getString("patient_lastname");
	gender = rs.getString("gender");
	age = rs.getInt("age");
	checkup_type = rs.getString("checkup_type");
	symptoms = rs.getString("symptoms");
	email = rs.getString("email");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	join_date = rs.getTimestamp("admitted_date");
	user_id = rs.getInt("user_id");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
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
	transition: 0.1s ease;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: #b3b0ab;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: white;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -50px;
	border-radius: 8px;
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

table {
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
	padding: 5px 10px;
	box-shadow: 0px 0px 5px 1px gainsboro;
	border-radius: 2%;
}

th {
	padding: 10px;
	font-size: 16px;
	text-align: left;
}

td {
	padding: 10px;
	font-size: 16px;
	color: black;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
}

.back p {
	text-align: center;
}

.back a {
	display: inline-block;
	text-align: center;
	margin-top: 1%;
	text-decoration: none;
	color: black;
	font-size: 18px;
	cursor: pointer;
	transition-duration: 0.4s;
	border: 2px solid transparent;
	padding: 12px;
}

.back a:hover {
	font-size: 20px;
	border: 2px solid dodgerblue;
}

.header p {
	background-color: white;
	font-size: 18px;
	padding: 8px 0px;
	text-align: center;
	font-weight: bolder;
	margin-top: 0;
	text-decoration: underline;
}

h1 {
	text-align: center;
}

@media screen and (max-width:600px) {
	
	td, th {
		font-size: 14px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
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




	<div class="patient_view">

		<%
		if (patientId != 0) {
		%>
		<div class="header">
			<p>Patient Details</p>
		</div>
		<table>
			<tr>
				<th>Patient Id:</th>
				<td><%=patientId%></td>
			</tr>
			<tr>
				<th>First Name:</th>
				<td><%=patientFirstName%></td>
			</tr>
			<tr>
				<th>Last Name:</th>
				<td><%=patientLastName%></td>
			</tr>
			<tr>
				<th>Gender:</th>
				<td><%=gender%></td>
			</tr>
			<tr>
				<th>Age:</th>
				<td><%=age%></td>
			</tr>
			<tr>
				<th>Check-up:</th>
				<td><%=checkup_type%></td>
			</tr>
			<tr>
				<th>Symptoms:</th>
				<td><%=symptoms%></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><%=email%></td>
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
				<td><%=join_date%></td>
			</tr>
			<tr>
				<th>User Id:</th>
				<td><%=user_id%></td>
			</tr>



		</table>

		<%
		} else {
		out.println("<h1>Patient not found</h1>");
		}
		%>
	</div>

	<div class="back">
		<p>
			<a href="adminViewPatients.jsp">Go Back</a>
		</p>
	</div>
</body>
</html>