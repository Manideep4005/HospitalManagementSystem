<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<%
String type = request.getParameter("doctorview");
int count = 0;
ResultSet rs = null;
ResultSet rs2 = null;

if (type.equals("all_list")) {
	response.sendRedirect("DisplayAllDoctorsServlet");
} else {
	PreparedStatement pstmt = MySqlConnection.getConnection()
	.prepareStatement("select * from doctor where specialization=?");
	pstmt.setString(1, type);

	rs = pstmt.executeQuery();

	while (rs.next()) {
		count++;
	}

	rs2 = pstmt.executeQuery();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor List | HMS</title>
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
	padding: 5px;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	box-shadow: 0 0 10px #008cba;
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
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: #b3b0ab;
	color: white;
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

.button-text {
	font-weight: 1000;
}	

.button-icon {
	font-size: 1.2em;
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
}

.nav {
	padding: 12px;
	margin-top: 2%;
}

.nav .form {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

select {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 2px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

select:focus {
	border: 2px solid dodgerblue;
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

h3 {
	text-align: center;
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
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="nav">
		<div class="login-container">
			<form method="post" action="adminViewSpecificDoctor.jsp" class="form">
				<select required name="doctorview">
					<option value="" selected disabled>Department
						Wise</option>
					<option value="all_list" class="option-color">All
						Departments</option>
					<option value="general physician" class="option-color">
						General Physician</option>
					<option value="cardiologist" class="option-color">
						Cardiologist</option>
					<option value="dermetalogist" class="option-color">
						Dermatologist</option>
					<option value="orthopedic" class="option-color">Orthopedic</option>
					<option value="gastroenterologist" class="option-color">
						Gatroenterologist</option>
					<option value="diabetic" class="option-color">Diabetics</option>
					<option value="anesthesiologists" class="option-color">
						Anesthesiologists</option>
					<option value="neurologists" class="option-color">
						Neurologists</option>
					<option value="pediatric" class="option-color">Pediatric</option>
					<option value="pulmonologist" class="option-color">
						Pulmonologist</option>
					<option value="urologist" class="option-color">Urologist</option>
				</select> &nbsp;&nbsp;&nbsp;
				<button type="submit">view</button>
			</form>
		</div>
	</div>

	<div class="scroll">
		<table>
			<%
			if (count == 0) {

				out.println("<h1>" + type + " currently unavailable</h1>");
			} else {
				out.println("<h3 id=\"one1\">List of " + type + "</h3>");
				out.println("<tr>");
				out.println("<th>Doctor Id</th>");
				out.println("<th>First Name</th>");
				out.println("<th>Last Name</th>");
				out.println("<th>Gender</th>");
				out.println("<th>Email</th>");
				out.println("<th>Education</th>");
				out.println("<th>Specialization</th>");
				out.println("<th>Experience (in years)</th>");
				out.println("<th>Address</th>");
				out.println("<th>Contact</th>");
				out.println("</tr>");
				while (rs2.next()) {
					out.println("<tr>");
					out.println("<td>" + rs2.getInt("doctor_id") + "</td>");
					out.println("<td>" + rs2.getString("doctor_firstname") + "</td>");
					out.println("<td>" + rs2.getString("doctor_lastname") + "</td>");
					out.println("<td>" + rs2.getString("gender") + "</td>");
					out.println("<td>" + rs2.getString("email") + "</td>");
					out.println("<td>" + rs2.getString("education") + "</td>");
					out.println("<td>" + rs2.getString("specialization") + "</td>");
					out.println("<td>" + rs2.getInt("experience") + "</td>");
					out.println("<td>" + rs2.getString("address") + "</td>");
					out.println("<td>" + rs2.getLong("contact") + "</td>");
					out.println("</tr>");

				}
			}
			%>
		</table>
	</div>


	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>

</body>
</html>