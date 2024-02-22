<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<%
String appointmentDate = request.getParameter("appdate");
Date date = Date.valueOf(appointmentDate);

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where appointment_date = ?");
pstmt.setDate(1, date);
ResultSet rs = pstmt.executeQuery();

boolean status = rs.next();

ResultSet rs1 = pstmt.executeQuery();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments Details | HMS</title>
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

.scroll {
	margin-top: 2%;
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
	transition: 0.4s ease;
}

.back a:hover {
	text-decoration: underline;
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
		<p>Search specific department</p>
		<div class="login-container">
			<form method="post" action="AdminAppointmentServlet">
				<select required name="doctorview">
     <option value="all">All</option>
      <option value="general">General Physician</option>
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
    </select> &nbsp;&nbsp;&nbsp;<button type="submit">view</button>
			</form>
		</div>
	</div>-->

	<div class="scroll">
		<!--  <table>
            <tr>
                <th>Appointment Id</th>
                <th>Patient Id</th>
                <th>Patient Name</th>
                <th>Check-up</th>
                <th>Appointment Date</th>
         </table>       <th>User Id</th>
            </tr>-->

		<%
		if (status) {
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Appointment Id</th>");
			out.println("<th>Patient Id</th>");
			out.println("<th>Patient First Name</th>");
			out.println("<th>Patient Last Name</th>");
			out.println("<th>Check-up</th>");
			out.println("<th>Appointment Date</th>");
			out.println("<th>User Id</th>");
			out.println("</tr>");
			while (rs1.next()) {
				out.println("<tr>");
				out.println("<td>" + rs1.getInt("appointment_id") + "</td>");
				out.println("<td>" + rs1.getInt("patient_id") + "</td>");
				out.println("<td>" + rs1.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs1.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs1.getString("checkup_type") + "</td>");
				out.println("<td>" + rs1.getDate("appointment_date") + "</td>");
				out.println("<td>" + rs1.getInt("user_id") + "</td>");
				out.println("</tr>");
			}
		} else {
			out.println("<h1>No appointments found on " + date + "</h1>");
		}
		out.println("</table>");
		%>


	</div>

	<div class="back">
		<p>
			<a href="adminAppointmentPage.jsp">Go Back</a>
		</p>
	</div>

</body>
</html>