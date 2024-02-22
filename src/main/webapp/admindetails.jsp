<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Integer id = (Integer) session.getAttribute("adminAccountId");
String userName = (String) session.getAttribute("adminName");
%>

<%
String FirstName = "";
String lastName = "";
String email = "";
String gender = "";
String address = "";
String password = "";
long contact = 0;

PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from admin where admin_id = ?");
pstmt.setInt(1, id);

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	FirstName = rs.getString("admin_firstname");
	lastName = rs.getString("admin_lastname");
	email = rs.getString("email");
	gender = rs.getString("gender");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	password = rs.getString("password");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	/*background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
	font-family: 'Poppins', sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: white;
	box-shadow: 0 0 10px gray;
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
	font-weight: bolder;
	transition: 0.1s ease;
	border-radius: 5px;
	font-weight: 700;
}

li a:hover, .dropdown:hover {
	background-color: #d3d3d3;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -80px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 450;
}

.dropdown-content a:hover {
	background-color: #778899;
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

.dropbtn span {
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
	font-size: 1.5em;
}

@media screen and (max-width:600px) {
	th, td {
		padding: 0px, 0px;
		font-size: 10px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	.details {
		padding: 5px;
		width: 300px;
	}
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.details {
	margin: 10px auto;
	width: 500px;
}

table {
	margin: auto;
	margin-top: 2%;
	border-radius: 10px;
	background-color: transparent;
	border: 1px solid #ccc;
	border-spacing: 0;
	border-collapse: collapse;
}

th, td {
	font-size: 20px;
	padding: 10px 15px;
	border: 1px solid gainsboro;
}

td {
	background: #f9f9f9;
}

th {
	background: #ccc;
}

.operations {
	width: 300px;
	margin: auto;
}

.operations form {
	width: 200px;
	margin: auto;
}

.operations form button {
	display: block;
	margin: 12px auto;
	width: 100%;
	font-size: 17px;
	background: #778899;
	border: 2px solid #778899;
	padding: 10px;
	cursor: pointer;
	transition-duration: .4s;
	color: white;
}

.operations form button:hover {
	background: black;
	color: white;
	border-color: black;
}

#back_home button {
	border: 2px solid #778899;
	color: #778899;
	background: white;
}

#back_home button:hover {
	color: black;
	border-color: black;
}

#success {
	margin: 10px auto;
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

#error {
	margin: 10px auto;
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
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
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">

					<a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="container">


		<c:if test="${adminUpdateSuccess != null}">
			<div id="success">${adminUpdateSuccess }</div>
		</c:if>

		<c:if test="${adminUpdateError != null}">
			<div id="error">${adminUpdateError }</div>
		</c:if>


		<div class="details">
			<table>
				<tr>
					<th>ID:</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>First Name:</th>
					<td><%=FirstName%></td>
				</tr>

				<tr>
					<th>Last Name:</th>
					<td><%=lastName%></td>
				</tr>

				<tr>
					<th>Email:</th>
					<td><%=email%></td>
				</tr>
				<tr>
					<th>Gender:</th>
					<td><%=gender%></td>
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
					<th>Password:</th>
					<td><%=password%></td>
				</tr>
			</table>
		</div>

		<div class="operations">
			<form method="post" action="AdminProfileDetails" id="update_profile">
				<button type="submit">Update Profile</button>
			</form>
			<form method="post" action="adminChangePassword.jsp"
				id="change_password">
				<button type="submit">Change Password</button>
			</form>
			<form method="post" action="adminmodule.jsp" id="back_home">
				<button type="submit">Back to Home</button>
			</form>
		</div>
	</div>
	
	
	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('error');
		get.style.display = 'none';
		}, 6000);
	</script>
</body>
</html>

<%
session.removeAttribute("adminUpdateSuccess");
session.removeAttribute("adminUpdateError");
%>