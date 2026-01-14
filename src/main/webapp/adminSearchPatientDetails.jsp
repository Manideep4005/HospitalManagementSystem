<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Long s = Long.parseLong(request.getParameter("mobilenumber"));

PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where contact = ?");
pstmt.setLong(1, s);

ResultSet rs1 = pstmt.executeQuery();

int count = 0;

while (rs1.next()) {
	count++;
}

ResultSet rs = pstmt.executeQuery();
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
	transition: 0.34s;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: #F6D7AF;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #D7BA89;
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

h1 {
	text-align: center;
}

.nav {
	padding: 10px;
}

.nav form, .get_details form {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

input {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

input:focus {
	box-shadow: 0 0 0 2px dodgerblue;
}

.nav button, .get_details button {
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

.nav button:hover, .get_details button:hover {
	border-color: transparent;
	background-color: #008cba;
	color: white;
}

#demo {
	color: red;
	text-align: center;
	margin: 0;
}

.scroll {
	padding: 0px 5px;
	overflow-y: auto;
	height: 500px;
	margin-top: 2%;
}

table {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 10px 10px;
	font-size: 16px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -5px;
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
	input {
		margin-left: 10px;
		padding: 10px 5px;
	}
	.nav form {
		width: 300px;
	}
}

#demo {
	font-size: 15px;
	margin: 0px;
	color: red;
}



.back button {
	
	display: block;
	margin-left: auto;
	margin-right: auto;
	padding: 12px;
	font-size: 16px;
	color: white;
	background-color: #168aaa;
	border: 2px solid transparent;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: .4s;
}

.back button:hover  {
	background-color: darkorange;
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

	<%
	if (s != 0 && count != 0) {
	%>

	<div class="nav">
		<span id="demo"></span>
		<div class="login-container">
			<form method="post" action="adminSearchPatientDetails2.jsp"
				onsubmit="return validate()">
				<input type="text" name="patientid" maxlength="5"
					placeholder="Enter Patient Id... for details" id="one">&nbsp;&nbsp;
				<button type="submit">view</button>
			</form>
		</div>
	</div>



	<%
	} else {

	}
	%>

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
	if (s == 0) {
		out.println("<h1>Search Above</h1>");
	}

	else if (count == 0) {
		out.println("<h1>Patients not found  (" + s + ")</h1>");
		out.println("<a href=\"adminSearchPatient.jsp\" class=\"back\">Go Back</a>");
	} else {
		out.println("<div class=\"scroll\">");
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>Patient Id</th>");
		out.println("<th>Patient First Name</th>");
		out.println("<th>Patient Last Name</th>");
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
		out.println("</div>");
	%>

	<div class="back">
		<form method="post" action="adminSearchPatient.jsp">
			<button type="submit">Go Back</button>
		</form>
	</div>

	<%
	}
	%>








	<script type="text/javascript">
		function validate() {

			var y = document.getElementById("one").value;

			if (isNaN(y)) {
				document.getElementById("demo").innerHTML = "Enter Numbers Only.";
				return false;
			} else if (y.length == "" || y.length < 5) {
				document.getElementById("demo").innerHTML = "Please Enter 5 Digit \"Patient ID\"";
				return false;
			} else {
				return true;
			}

		}
	</script>

</body>
</html>
