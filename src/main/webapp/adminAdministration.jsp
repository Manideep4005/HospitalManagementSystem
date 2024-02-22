<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8" />
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
	font-weight: 300;
	transition: 0.34s ease;
	border-radius: 5px;
	font-weight: 1000;
}

li a:hover, .dropdown:hover {
	background-color: #a7ede8;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: gainsboro;
	min-width: 160px;
	margin-left: -40px;
	box-shadow: 0px 8px 16px 0px #f1f1f1;
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
	background-color: #a7ede8;
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

.div_1, .div_2 {
	margin-top:  50px;
	margin-left: auto;
	margin-right: auto;
	width: 200px;
	box-shadow: -10px -10px #008CBA, 4px 4px #008CBA, 0 0 0 1px dodgerblue;
	height: 200px;
	display: table;
	transition-duration: 2s;
	cursor: pointer;
	animation: shape 10s infinite;
}

.div_1:hover, .div_2:hover {
	box-shadow: 0px 0px 0px 2px dodgerblue;
	animation:  none;
}

.div_1 a, .div_2 a {
	display: block;
	text-align: center;
	text-decoration: none;
	color: black;
	font-size: 18px;
	padding: 100px 0px;
	font-weight: bold;
}

@keyframes shape {
	50% {
		box-shadow: 12px 12px #008CBA, -6px -6px #008CBA, 0 0 0 1px #008cba;
	}
}

@media screen and (max-width: 600px) {
	.dropdown-content {
		margin-left: -60px;
	}
	li a {
		padding: 12px 10px;
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
						href="adminAppointmentDetails.jsp">Appointment List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="div_1">
		<a href="adminViewUsers.jsp"> Users </a>
	</div>

	<div class="div_2">
		<a href="adminViewAdmins.jsp"> Admins </a>
	</div>


	<!-- <div class="one">
    <form method="post" action="adminViewUsers.jsp" class="div_1">
      <button type="submit">Users</button>
    </form>
  </div>

  <div class="two">
    <form method="post" action="adminViewAdmins.jsp" class="div_2">
      <button type="submit">Admins</button>
    </form>
  </div>-->

</body>
</html>
