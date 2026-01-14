<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

<%@include file="adminSessionValidate.jsp"%>
<%
Integer id = Integer.parseInt(request.getParameter("patientid"));

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from patient where patient_id = ?");
pstmt.setInt(1, id);

boolean status;

ResultSet rs = pstmt.executeQuery();

status = rs.next();

ResultSet rs1 = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details | HMS</title>
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
	transition: 0.34s  ;
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
	background-color: #F6D7AF;
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

table {
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
	padding: 15px 10px;
	box-shadow: 0px 0px 10px 1px #F6D7AF;
	border-radius: 1%;
	transition: 0.34s ease;
}

 

th {
	padding: 5px 10px;
	font-size: 15px;
	text-align: left;
}

td {
	padding: 5px 10px;
	font-size: 15px;
	color: black;
}

h1 {
	text-align: center;
	font-family: cursive;
}

form button {
	display: block;
	margin-top: 2.5%;
	margin-left: auto;
	margin-right: auto;
	border: none;
	padding: 10px 15px;
	border-radius: 3px;
	font-size: 16px;
	background-color: #168AAD;
	color: white;
	transition-duration: .4s;
	cursor: pointer;
}

form button:hover {
	background-color: #eba46e;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
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
					<a href="admindetails.jsp">My Account</a> <a
						href="adminViewPatients.jsp">Patients List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>



	<!-- <div class="nav">
        <p>Search Patients</p>
        <div class="login-container">
            <form method="post" action="adminSearchPatientDetails.jsp">
                <input type="text" name="mobilenumber" required maxlength="5" placeholder="Contct...">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div> -->

	<div class="view">

		<%
		if (status == false) {
			out.println("<h1>No data found</h1>");

		} else {
			while (rs1.next()) {
				out.println("<h1>Data found below</h1>");
				out.println("<table>");
				out.println("<tr>");
				out.println("<th>Patient Id</th>");
				out.println("<td>" + rs1.getInt("patient_id") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>First Name</th>");
				out.println("<td>" + rs1.getString("patient_firstname") + "</td>");
				out.println("<tr>");
				out.println("<th>Last Name</th>");
				out.println("<td>" + rs1.getString("patient_lastname") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Gender</th>");
				out.println("<td>" + rs1.getString("gender") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Age</th>");
				out.println("<td>" + rs1.getInt("age") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Check-up</th>");
				out.println("<td>" + rs1.getString("checkup_type") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Symptoms</th>");
				out.println("<td>" + rs1.getString("symptoms") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Email</th>");
				out.println("<td>" + rs1.getString("email") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Address</th>");
				out.println("<td>" + rs1.getString("address") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Contact</th>");
				out.println("<td>" + rs1.getLong("contact") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>Join Date</th>");
				out.println("<td>" + rs1.getTimestamp("admitted_date") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th>User Id</th>");
				out.println("<td>" + rs1.getInt("user_id") + "</td>");
				out.println("</tr>");
				out.println("</table>");
			}
		}
		%>
	</div>

	<div class="back">
		<form method="post" action="adminSearchPatient.jsp">
			<button type="submit">Go back</button>
		</form>
	</div>

</body>
</html>
