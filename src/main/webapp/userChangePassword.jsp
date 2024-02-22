<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>





<%
Integer id = (Integer) session.getAttribute("userAccountId");
String userName = (String) session.getAttribute("currentUserName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Welcome</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	text-align: center;
	padding: 10px 0px;
	margin-top: 0px;
	color: black;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	color: black;
	text-decoration: underline;
	text-decoration-color: #168AAa;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid gray;
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
	transition: 0.4s ease;
}

li a:hover, .dropdown:hover {
	background-color: #ccc7bf;
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
	background-color: #ccc7bf;
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
	font-weight: 500;
	color: black;
}

.dropbtn span {
	font-weight: 500;
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
	padding: 20px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}

label {
	margin-top: 10px;
	font-size: 20px;
	color: black;
	font-weight: 200;
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
	transition: 0.34s ease;
}

input[type=password]:focus {
	border: 2px solid #317AC7;
}

.change form {
	border: 3px solid transparent;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0px 0px 0px 1px #808080;
	margin-top: 5%;
	padding: 20px;
}

.change form button {
	padding: 16px 32px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #168AAa;
	background-color: #168AaA;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
	color: white;
	margin-top: 5px; 
	display: block;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
}

.change form button:hover {
	color: black;
	background-color: white;
}

#demo {
	margin: 0;
	color: red;
	font-weight: bold;
	padding-left: 2%;
}

#demo1, .error {
	font-weight: bold;
	margin: 0;
	color: green;
	padding-left: 2%;
}

.error {
	font-weight: bold;
	color: red;
	font-size: 18px;
	margin-bottom: 12px;
	padding-left: 0px;
}

@media screen and (max-width: 600px) {
	.change form {
		width: 320px;
	}
	li a {
		padding: 10px 8px;
	}
	a img {
		width: 0.8em;
	}
}

#back {
	width: 100px;
	margin-top: 2%;
	margin-left: auto;
	margin-right: auto;
}

.btn {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	padding: 16px 32px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #008CBA;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
}

.btn:hover {
	color: white;
	background-color: #008CBA;
}

.change input.invalid {
	border: 2px solid red;
}



</style>

<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo').innerHTML = '';
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
	
	
	function validateForm() {
		var y = document.getElementsByClassName('one');
		var i, valid = true;
		for (i = 0; i < y.length; i++) {
			if (y[i].value == "") {
				y[i].className += " invalid";
				valid = false;
			}
		}
		var pass = check();
		
		var final = valid && pass;
		
		return final;
	}
</script>

</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=id%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userAppointmentHistory.jsp">Appointment
						History</a> <a href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="header">
		<p>Change Password</p>

	</div>


	<div class="change">
		<form action="ChangeUserPasswordServlet" method="post"
			onsubmit="return validateForm()">
			<p class="error">${errorPassword }</p>
			<label for="password">Enter new Password</label> <input
				type="password" name="newpassword"   id="pass" class="one" oninput="this.className=''" onkeyup=" check()"> <label
				for="password">Re-Enter Password</label> <input type="password"
				name="newpassword1"  id="repass" class="one" oninput="this.className=''" onkeyup=" check()">
			<p id="demo"></p>
			<p id="demo1"></p>
			<button type="submit">Reset</button>
		</form>
	</div>


	<div id="back">
		<form action="userdetails.jsp" method="post">
			<button type="submit" class="btn">Back</button>
		</form>

	</div>

</body>
</html>