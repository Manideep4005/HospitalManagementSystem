<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Integer userId = (Integer) session.getAttribute("adminAccountId");
String adminName = (String) session.getAttribute("adminName");

Statement stmt = MySqlConnection.getConnection().createStatement();
ResultSet rs = stmt.executeQuery("select * from user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users | HMS</title>
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
	padding: 0;
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid gainsboro;
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
	font-weight: 700;
	transition: 0.1s ease;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;;
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
	background-color: #0295A9;
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
	font-size: 1.2em;
}

.nav {
	padding: 10px;
}

.nav .form {
	width: 300px;
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

#demo {
	color: red;
	text-align: center;
	margin: 0;
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
	input {
		margin-left: 10px;
		padding: 10px 5px;
	}
}

h1 {
	text-align: center;
}

.get_details button {
	background-color: #168AAD;
	width: 100px;
	color: white;
	padding: 10px 16px;
	margin: 10px 0px;
	border: 2px solid transparent;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	cursor: pointer;
	transition-duration: .4s;
}

.get_details button:hover {
	border: 2px solid #168AAd;
	background-color: white;
	color: black;
}

#userId {
	color: dodgerblue;
	text-decoration: none;
	transition-duration: .4s;
}

#userId:hover {
	transform: scale(1.1);
}
</style>
</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 0px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=adminName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="/HMS/AdminDisplayAllDoctors">Doctors List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="scroll">
		<table>
			<tr>
				<th>User Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Password</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Joined Date</th>
			</tr>



			<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td><a id=\"userId\" href=\"adminViewUsersAppointments.jsp?id=" + rs.getInt("userid") + "\">"
						+ rs.getInt("userid") + "</a></td>");
				out.println("<td>" + rs.getString("first_name") + "</td>");
				out.println("<td>" + rs.getString("last_name") + "</td>");
				out.println("<td>" + rs.getString("password") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("gender") + "</td>");
				out.println("<td>" + rs.getString("address") + "</td>");
				out.println("<td>" + rs.getLong("contact") + "</td>");
				out.println("<td>" + rs.getDate("join_date") + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
	</div>


	<div class="get_details">
		<form method="post" action="adminmodule.jsp">
			<button type="submit">Go Back</button>
		</form>
	</div>

	<script type="text/javascript">
		function validateForm() {

			var y = document.getElementById("one").value;

			if (isNaN(y)) {
				document.getElementById("demo").innerHTML = "Enter Numbers Only.";
				return false;
			} else if (y.length == "" || y.length < 5) {
				document.getElementById("demo").innerHTML = "Please Enter 5 Digit Id";
				return false;
			} else {
				return true;
			}

		}
	</script>

</body>
</html>