<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Admin Registration</title>

<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background-color: #CAF4FF;
}

.header {
	position: sticky;
	top: 0;
	padding: 10px;
	background-color: #CAF4FF;
	box-shadow: 0 0 3px 1px #f6d7ad;
}

.header nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 10px;
}

.header nav img {
	max-width: 180px;
}

.header nav a {
	text-decoration: none;
	color: white;
	background: dodgerblue;
	font-size: 17px;
	padding: 10px;
	border-radius: 5px;
}

.details_tab {
	padding: 15px;
}

form {
	margin: 20px auto;
	max-width: 550px;
	padding: 25px;
	background: #fff;
	box-shadow: 0 0 15px #abb4a7;
	border-radius: 8px;
}

input, select, textarea {
	width: 100%;
	margin: 8px 0;
	padding: 12px;
	border: 1px solid #a7b4b0;
	border-radius: 5px;
	font-size: 16px;
	outline: none;
}

input.invalid, select.invalid, textarea.invalid {
	border: 1px solid red;
}

button {
	width: 100%;
	margin-top: 10px;
	padding: 12px;
	font-size: 18px;
	background-color: dodgerblue;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	opacity: 0.9;
}

#error {
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid red;
	padding: 10px;
	color: red;
	margin-bottom: 10px;
	border-radius: 5px;
}

#demo1,#demo2,#demo3,#demo4,#demo5,#demo6 {
	font-size: 14px;
	color: red;
	padding-left: 4px;
}

.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.6);
	z-index: 10;
}

.loader {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 11;
}

.spin {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 5px solid white;
	border-top-color: dodgerblue;
	animation: spin 1s linear infinite;
}

@keyframes spin {
	to { transform: rotate(360deg); }
}

@media screen and (max-width: 600px) {
	form {
		width: 95%;
	}
}
</style>
</head>

<body onload="document.querySelector('.registerForm').reset();">

<div class="header">
	<nav>
		<img src="CSS/MANI_HOSPITAL.png" alt="Hospital Logo">
		<a href="Adminlogin.jsp">Sign in <i class="fa fa-sign-in"></i></a>
	</nav>
</div>

<div class="overlay"></div>
<div class="loader"><div class="spin"></div></div>

<div class="details_tab">
	<form method="post"
		action="AdminRegisterServlet"
		class="registerForm"
		id="signUpForm"
		onsubmit="return validateForm()">

		<c:if test="${adminRegisterError != null}">
			<div id="error">${adminRegisterError}</div>
		</c:if>

		<input type="text" name="adminfname" placeholder="First Name" class="one">
		<p id="demo1"></p>

		<input type="text" name="adminlname" placeholder="Last Name" class="one">
		<p id="demo2"></p>

		<select name="gender" class="one">
			<option value="" disabled selected>--- Gender ---</option>
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select>

		<input type="email" name="email" placeholder="Email" class="one">
		<p id="demo3"></p>

		<input type="text" name="mobilenumber" placeholder="Mobile Number"
			maxlength="10" class="one">
		<p id="demo4"></p>

		<textarea name="address" placeholder="Address" class="one"></textarea>
		<p id="demo5"></p>

		<input type="password" name="pass1" id="pass"
			placeholder="Password" class="one">

		<input type="password" name="password" id="repass"
			placeholder="Confirm Password"
			class="one" onkeyup="validatePassword()">
		<p id="demo6"></p>

		<button type="submit">Register</button>
	</form>
</div>

<script>
function validateForm() {
	let valid = true;
	let fields = document.getElementsByClassName("one");

	for (let i = 0; i < fields.length; i++) {
		if (fields[i].value === "") {
			fields[i].classList.add("invalid");
			valid = false;
		}
	}

	if (!validatePassword()) valid = false;

	if (valid) {
		document.querySelector(".overlay").style.display = "block";
		document.querySelector(".loader").style.display = "block";
	}
	return valid;
}

function validatePassword() {
	let pass = document.getElementById("pass").value;
	let repass = document.getElementById("repass").value;

	if (pass.length < 8) {
		document.getElementById("demo6").innerHTML =
			"Password must be at least 8 characters";
		return false;
	}
	if (pass !== repass) {
		document.getElementById("demo6").innerHTML =
			"Passwords do not match";
		return false;
	}
	document.getElementById("demo6").innerHTML = "Password matched";
	document.getElementById("demo6").style.color = "green";
	return true;
}
</script>

</body>
</html>

<% session.removeAttribute("adminRegisterError"); %>
