<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminSessionValidate.jsp" %> 
<%
String s = request.getParameter("department");

PreparedStatement pstmt = null;
ResultSet rs = null;

int count = 0;

pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where checkup_type = ?");
pstmt.setString(1, s);

ResultSet rs1 = pstmt.executeQuery();

while (rs1.next()) {
	count++;
}

rs = pstmt.executeQuery();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient View | HMS</title>
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
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: transparent;
	border-bottom: 1px solid gainsboro;
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
	transition: 0.34s ease;
	border-radius: 5px;
	font-weight: 1000;
}

li a:hover, .dropdown:hover {
	background-color: lavender;
	color: black;
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
	box-shadow: 0px 8px 16px 0px #d28d3d;
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
	transition: 0.34s ease;
}

.dropdown-content a:hover {
	background-color: #eba46e;
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

h1 {
	text-align: center;
}

#back {
	color: black;
	border: none;
	background-color: transparent;
	font-size: 17px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	font-weight: bolder;
	cursor: pointer;
	text-decoration: none;
	transition: 0.34s ease;
}

#back:hover {
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
					<a href="admindetails.jsp">My Account</a> <a
						href="adminViewPatients.jsp">Patients List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>



	<div class="nav">
		<div class="login-container">
			<form method="post" action="adminPatientsDepartmentView.jsp">
				<select required name="department">
					<option value="" disabled="disabled" selected>--select department--</option>
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
		
			<!--    <tr>
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
            
        </tr>-->

			<%
			if (s == null) {
				out.println("<h1>Search Above</h1>");

			}

			else if (count == 0) {
				out.println("<h1>Patients not found  (" + s + ")</h1>");
			} else {
				out.println("<h1>Patients found  (" + s + ")</h1>");
				out.println("<table>");
				out.println("<tr>");
				out.println("<th>Patient Id</th>");
				out.println("<th>First Name</th>");
				out.println("<th>Last Name</th>");
				out.println("<th>Gender</th>");
				out.println("<th>Age</th>");
				out.println("<th>check-up</th>");
				out.println("<th>Symptoms</th>");
				out.println("<th>Email</th>");
				out.println("<th>Address</th>");
				out.println("<th>Contact</th>");
				out.println("<th>Appointment date</th>");
				out.println("<th>User Id</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("patient_id") + "</td>");
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
				out.println("</table>");

			}
			%>

		

	</div>

	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>

</body>
</html>
