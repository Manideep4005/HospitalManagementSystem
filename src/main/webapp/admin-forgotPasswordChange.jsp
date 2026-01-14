<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer userId = (Integer) session.getAttribute("adminIdValidateOtp");
%>
<!DOCTYPE html>
<html>
<head>
<title>Reset Password | Hospital Management System</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
}

body {
	background: #fffff7;
}

.header {
	padding: 15px;
	box-shadow: 0 0 5px 1px gainsboro;
}

.header > img {
	 max-width: 150px;
	 margin-left: 10px;
	box-shadow: 0 0 10px 1px gainsboro;
}

.header h2 {
	text-align: center;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 0 5px gray;
}

.container form {
	width: 400px;
	margin: auto;
}

.container form #heading {
	text-align: center;
	font-size: 20px;
}

.container form label {
	margin: 12px 0;
	display: block;
	font-size: 17px;
}

.container form input {
	padding: 10px;
	margin: 12px 0;
	display: block;
	width: 100%;
	font-size: 16px;
	background: transparent;
	outline: none;
	border: 1px solid grey;
	border-radius: 5px;
	transition-duration: .4s;
}

.container form input:focus {
	border-color: transparent;
	box-shadow: 0 0 0 2px #168aaa;
}

.container form button {
	padding: 10px;
	display: block;
	margin: 15px 0;
	width: 100%;
	font-size: 16px;
	background: #168aaa;
	outline: none;
	color: white;
	cursor: pointer;
	transition-duration: .4s;
	border: none;
}

.container form button:hover {
	background: #165aaa;
}

#login_user {
	display: block;
	margin: 20px 0;
	text-align: center;
	font-size: 15px;
}

#login_user a {
	text-decoration: none;
	color: #168aaa;
	transition-duration: .4s;
}

#login_user a:hover, #register_user a:hover {
	color: #178aaa;
	text-decoration: underline;
}

#register_user {
	display: block;
	margin: 15px 0;
	text-align: center;
	font-size: 15px;
}

#register_user a {
	text-decoration: none;
	color: #168aaa;
	transition-duration: .4s;
}

@media screen and (max-width: 600px) {
	.container {
		top: 45%;
	}
	.container form {
		width: 280px;
	}
	.header h2 {
		font-size: 18px;
	}
}

#message {
	margin: 10px 0 0 0;
	color: red;
}

#user_id {
	cursor: not-allowed;
	background: gainsboro;
}

#demo, #demo1 {
	margin: 0;
	color: red;
	font-weight: bold;
	padding-left: 2%;
}

.button {
	position: relative;
	padding: 10px;
	background: #168aaa;
	border: none;
	outline: none;
	border-radius: 2px;
	cursor: pointer;
	width: 100%;
	margin: 8px 0;
}

.button:active {
	background: dodgerblue;
}

.button__text {
	font-size: 18px;
	font-weight: 700;
	color: white;
	transition: all 0.2s;
}

.button--loading .button__text {
	visibility: hidden;
	opacity: 0;
}

.button--loading::after {
	content: "";
	position: absolute;
	width: 16px;
	height: 16px;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	border: 4px solid transparent;
	border-color: #ccc;
	border-top-color: white;
	border-radius: 50%;
	animation: button-loading-spinner 1s linear infinite;
}

@keyframes button-loading-spinner {

	from { transform:rotate(0turn);
		border-top-color: green;
	}

to {
	transform: rotate(1turn);
	border-top-color:darkorange;
}
}
</style>

</head>
<body onload="document.querySelector('#form').reset();">

	<div class="header">
		<img alt="" src="CSS/MANI_HOSPITAL.png">
		<h2>Hospital Management System</h2>
	</div>

	<div class="container">
		<form action="AdminForgotPasswordChange" method="POST" id="form"
			onsubmit="return valid()">

			<p id="heading">Reset Password</p>

			<c:if test="${adminForgotPasswordChangeError != null}">
				<p id="message">${adminForgotPasswordChangeError }</p>
			</c:if>


			<input type="hidden" value="${adminIdValidateOtp }" name="adminId">
			<label>Password</label> <input type="password" id="pass"
				onkeyup=" check()"> <label for="password">Re-Enter
				Password</label> <input type="password" id="repass" name="password"
				onkeyup=" check()">
			<p id="demo"></p>
			<p id="demo1"></p>
			<button type="submit" class="button">
				<span class="button__text">Reset Password</span>
			</button>
		</form>

		<p id="login_user">
			Already have an account?&nbsp;<a href="Adminlogin.jsp">Sign in</a>
		</p>
		<p id="register_user">
			Don't have an account yet?&nbsp;<a href="adminregister.jsp">Create
				Account</a>
		</p>


	</div>
	<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;
		var valid = false;
		
		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo1').innerHTML = 'please enter password';
			valid = false;
		} else if(pass.length <= 7 || repass.length <= 7) {
			document.getElementById('demo').innerHTML = 'Password must be 8 characters long';
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').style.color = 'red';
			valid = false;
		}else if((pass.length >= 7 || repass.length >= 7) && pass != repass) {
			document.getElementById('demo').innerHTML = 'Passwords doesn\'t match';
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').style.color = 'red';
			valid = false;
		}
		else{
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').innerHTML = 'Password matched';
			document.getElementById('demo').style.color = 'green';
			valid = true;
		}
		
		
   		
   		return valid;
       
	}
	
	function valid() {
		var ans = check();
		
		var btn = document.querySelector(".button");

   		
	       
   		if (ans) {
   			btn.classList.toggle("button--loading");
   			btn.disabled = true;
   		}
   		
   		return ans;
	}
	
	setTimeout(() => {
		let get = document.getElementById('demo1');
		get.style.display = 'none';
		}, 5000);
	
</script>
</body>
</html>
