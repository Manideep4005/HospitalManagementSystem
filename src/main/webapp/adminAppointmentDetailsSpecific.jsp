<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<%
String type = (String) session.getAttribute("Appointment_type");

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where checkup_type=?");
pstmt.setString(1, type);

int count = 0;
ResultSet rs1 = pstmt.executeQuery();

while (rs1.next()) {
	count++;
}

ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>Appointment Details | HMS</title>
=======
<title>Welcome | HMS</title>
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
	border-bottom: 1px solid #EBF1F1;
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
	height: 550px;
}

table {
	margin-right: auto;
	margin-left: auto;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 10px 8px;
	font-size: 15px;
	text-align: left;
	border: 1px solid #ccc;
	position: sticky;
	top: -1px;
	background-color: #a8a8a8;
	border-bottom: 1px solid black;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 8px;
	font-size: 15px;
}

h1 {
	text-align: center;
	color: #60FD00;
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
	select {
		width: 40%;
	}
}

.nav {
	padding: 10px;
}

.nav form {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

select {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

select:focus {
	box-shadow: 0 0 0 2px dodgerblue;
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



.back button {
	border: none;
	background-color: transparent;
	font-size: 17px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 0.5%;
	font-weight: bolder;
	cursor: pointer;
	text-decoration: none;
	transition: 0.34s ease;
}

.back button:hover {
	text-decoration: underline;
}
</style>

</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp"  >Home</a></li>
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
						href="adminAppointmentDetails.jsp">Appointments</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="nav">
		<div class="login-container">
			<form method="post" action="AdminAppointmentServlet">
				<select required name="doctorview">
					<option value="" selected="selected" disabled="disabled">Search specific appointment</option>
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
				</select> &nbsp;&nbsp;&nbsp;
				<button type="submit">view</button>
			</form>
		</div>
	</div>


	<div class="scroll">
		<div class="appintment_view">


			<%
			if (count == 0) {
				out.println("<h1>No Appointments</h1>");
			} else {
				out.println("<table>");
				out.println("<tr>");
				out.println("<th>Appointment ID</th>");
				out.println("<th>Patient Id</th>");
				out.println("<th>Patient First Name</th>");
				out.println("<th>Patient Last Name</th>");
				out.println("<th>checkup-up</th>");
				out.println("<th>Appointment Date</th>");
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
				out.println("</table>");
			}
			%>


		</div>
	</div>

	<div class="back">
		<form action="adminAppointmentDetails.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
	</div>
	
	
	<script type="text/javascript">
	yes_js_login = function(e) {
		  e.preventDefault();
		}

	</script>
	
	
</body>
</html>