<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.CurrentDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>

<%
Date date = CurrentDate.getCurrnetDate();

PreparedStatement stmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where appointment_date=?");
stmt.setDate(1, date);
ResultSet rs1 = stmt.executeQuery();

int count = 0;

while (rs1.next()) {
	count++;
}

ResultSet rs = stmt.executeQuery();

SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
String currentDate = formatter.format(date);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Today Appointments Details | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<style type="text/css">
body {
	margin: 0;
	backround-color: white;
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
	box-shadow: 0px 1px 0px 0px grey;
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
	transition: 0.4s;
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
	display: none;
	position: absolute;
	min-width: 160px;
	text-align: center;
	margin-left: -50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 8px;
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
	font-size: 16px;
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
	font-size: 16px;
	border: 1px solid #ccc;
}



@media screen and (max-width:600px) {
	.scroll {
		height: 450px;
		padding: 5px;
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
 
}

h1 {
	text-align: center;
}

.current form {
	margin-top: 1%;
}

.current button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid transparent;
	padding: 10px 5px;
	width: 150px;
	border-radius: 5px;
	background-color: transparent;
	cursor: pointer;
	font-weight: bold;
	transition: 0.35s ease;
	text-decoration: underline;
	font-size: 17px;
}

.current button:hover {
	border-color: orange;
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

	<!--   <div class="nav">
        <p>Enter Patient Id For Complete Details</p>
        <div class="login-container">
            <form method="post" action="adminViewPatientDetails.jsp">
                <input type="text" name="patientId" required maxlength="5" placeholder="Enter patient id">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>-->

	<div class="scroll">
		<table>
			<!--   <tr>
                <th>Appointment Id</th>
                <th>Patient Id</th>
                <th>Patient Name</th>
                <th>Check-up</th>
                <th>Appointment Date</th>
                <th>User Id</th>
            </tr>-->

			<%
			if (count == 0) {
				out.println("<H1>No Appointments Today - " + currentDate + "</h1>");
			} else {
				out.println("<tr>");
				out.println("<th>Appointment Id</th>");
				out.println("<th>Patient Id</th>");
				out.println("<th>Patient First Name</th>");
				out.println("<th>Patient Last Name</th>");
				out.println(" <th>Check-up</th>");
				out.println(" <th>Appointment Date</th>");
				out.println("<th>User Id</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("appointment_id") + "</td>");
					out.println("<td>" + rs.getInt("patient_id") + "</td>");
					out.println("<td>" + rs.getString("patient_firstname") + "</td>");
					out.println("<td>" + rs.getString("patient_lastname") + "</td>");
					out.println("<td>" + rs.getString("checkup_type") + "</td>");
					out.println("<td>" + rs.getDate("appointment_date") + "</td>");
					out.println("<td>" + rs.getInt("user_id") + "</td>");
					out.println("</tr>");
				}

			}
			%>

		</table>
	</div>

	<div class="current">
		<form action="adminAppointmentPage.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
	</div>
</body>
</html>