<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminSessionValidate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Success</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
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
	background-image: white;
}

.header {
	background-color: white;
	text-align: center;
	padding: 10px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	text-decoration: underline;
	color: black;
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
	transition-duration: 0.4s;
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
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -40px;
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
	height: 38px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
	font-weight: 300;
}

.dropbtn span:hover {
	color: black;
}

.dropbtn span {
	font-weight: 600;
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
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
}

#back {
	margin: 10% auto;
}

#back h1 {
	text-align: center;
}

#back a {
	text-decoration: none;
	display: block;
	text-align: center;
	background: white;
	color: dodgerblue;
	font-size: 18px;
	border: 2px solid dodgerblue;
	transition-duration: .4s;
	width: 200px;
	margin: auto;
	padding: 12px;
}

#back a:hover {
	color: white;
	background: dodgerblue;
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
						src="CSS/user.png"></span> <span class="button-text">${adminName }</span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: ${adminAccountId }</a> <a
						href="admindetails.jsp">My Details</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>
	<div id="back">
		<h1>Password Changed Successfully</h1>
		<a href="adminmodule.jsp">Back To Home</a>
	</div>
</body>
</html>
