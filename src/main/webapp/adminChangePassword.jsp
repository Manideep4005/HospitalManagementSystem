<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Integer id = (Integer) session.getAttribute("adminAccountId");
String userName = (String) session.getAttribute("adminName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password Admin | HMS</title>
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

label {
	display: block;
	font-size: 20px;
	color: black;
	font-weight: 200;
	font-size: 20px;
}

input[type=password] {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
	border: 2px solid #808080;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	background-color: transparent;
	transition-duration: 0.34s ease;
}

input[type=password]:focus {
	border: 2px solid #317AC7;
}

 

#show {
	background-color: #168AAa;
	padding: 12px 20px;
	border-radius: 5px;
	transition-duration: .4s;
	border: 2px solid #317ac7;
	color: white;
	margin-left: 3%;
	cursor: pointer;
	display: inline-block;
}

.change form {
	border: 3px solid transparent;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0px 0px 0px 1px #808080;
	margin-top: 3%;
	padding: 20px;
}

button {
	background-color: #168AAa;
	width: 100%;
	color: white;
	padding: 12px 10px;
	font-size: 17px;
	margin: 10px 0px;
	border: none;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: 0.4s;
}

button:hover {
	background-color: dodgerblue;
	color: white;
}

#demo {
	margin: 0;
	color: red;
	padding-left: 2%;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	.change form {
		width: 320px;
	}
	input[type=password] {
		width: 100%;
	}
}

.back button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	padding: 12px 10px;
	font-size: 17px;
	color: dodgerblue;
	border: 2px solid dodgerblue;
	transition-duration: .4s;
	cursor: pointer;
	background: transparent;
	width: 20%;
}

.back button:hover {
	background-color: dodgerblue;
	color: white;
	border-color: transparent;
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
					<a href="#">My ID: <%=id%></a> <a href="admindetails.jsp">My
						Details</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="change">
		<form action="ChangeAdminPasswordServlet" method="post"
			onsubmit="return check()">
			<p style="color: red; font-size: 18px;">${adminPasswordError }</p>
			<label for="password">Enter new Password</label> <input
				type="password" name="newpassword" id="pass"  ><label for="password">Re-Enter
				Password</label> <input type="password" name="newpassword1" id="repass"
				onkeyup="check()"  > 
			<p id="demo"></p>
			<button type="submit">Reset</button>
		</form>
	</div>

	<div class="back">
		<form action="admindetails.jsp">
			<button type="submit" class="">Back</button>
		</form>
	</div>






<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo').innerHTML = '';
			return false;
		} else if (repass.length <= 7) {
			document.getElementById('demo').innerHTML = 'Password must be 8 characters long';
			document.getElementById('demo').style.color = 'red';
			return false;
		} else if (pass != repass) {
			document.getElementById('demo').innerHTML = 'Password doesn\'t match';
			document.getElementById('demo').style.color = 'red';
			return false;
		} else {
			document.getElementById('demo').innerHTML = 'Password matched';
			document.getElementById('demo').style.color = 'green';
			return true;
		}
	}

	 
</script>











</body>
</html>


<%
session.removeAttribute("adminPasswordError");
%>
