<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminSessionValidate.jsp"%>

<% if (session.getAttribute("doctorName") == null || session.getAttribute("doctorLoginId") == null )
		response.sendRedirect("adminmodule.jsp");	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

.header {
	background-color: #808080;
	text-align: center;
	padding: 10px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	font-family: 'Copperplate Gothic';
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #778899;
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
	font-family: 'Copperplate Gothic';
	font-weight: 700;
	transition: 0.1s ease;
	border-radius: 5px;
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
	font-weight: 300;
}

.dropdown-content a:hover {
	background-color: #778899;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 38px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-family: 'Copperplate Gothic';
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

.details h2 {
	text-align: center;
	font-family: 'Copperplate Gothic';
}

.inner-details p {
	font-size: 18px;
	text-align: left;
	font-weight: bold;
	padding-left: 5%;
}

.inner-details {
	margin-top: 1.5%;
	border: 3px solid;
	border-color: #778899;
	box-shadow: 0px 0px 8px 0px rebeccapurple;
	border-radius: 10px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px 0px;
}

form button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
	padding: 8px 10px;
	border: none;
	border-radius: 10px;
	width: 100px;
	background-image: linear-gradient(to right, #EE9CA7, #FFDDE1);
	font-weight: bold;
	cursor: pointer;
	transition: 0.35s ease;
}

form button:hover {
	box-shadow: 0px 0px 10px 0px rebeccapurple;
	border: none;
	color: #131313;
	background-image: linear-gradient(to right, #A9F1DF, #FFBBBB);
	padding: 10px 10px;
	width: 200px;
}

@media screen and (max-width:600px) {
	
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
					<a href="adminmodule.jsp">My Account</a> <a href="admindetails.jsp">My
						Account</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="details">
		<h2>
			The login credentials for Dr.
			<%=session.getAttribute("doctorName")%></h2>
		<div class="inner-details">
			<p>
				Doctor Id:
				<%=session.getAttribute("doctorLoginId")%></p>
			<p>
				Password:
				<%=session.getAttribute("doctorPassword")%>
				(Personal Email)
			</p>
		</div>
	</div>

	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button value="submit">Back</button>
		</form>
	</div>
</body>
</html>
