<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
 
=======

<%

	Integer userId = (Integer)session.getAttribute("userIdValidateOtp");

%>
>>>>>>> e06896c5d3b881a587992830e685134132707732

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
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
	box-shadow: 0 0 10px 1px gainsboro;
}

<<<<<<< HEAD
.header  > img {
	max-width: 150px;
	margin-left: 10px;
=======
.header h2 {
	text-align: center;
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
</style>

</head>
<body onload="document.querySelector('#form').reset();">

	<div class="header">
<<<<<<< HEAD
		<img src="CSS/MANI_HOSPITAL.png">
=======
		<h2>Hospital Management System</h2>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>

	<div class="container"> 
		<form action="UserForgotPasswordChange" method="POST" id="form" onsubmit="return check()">

			<p id="heading">Reset Password</p>

			<c:if test="${userForgotPasswordChangeError != null}">
				<p id="message">${userForgotPasswordChangeError }</p>
			</c:if>

			
			<input type="hidden" value="${userIdValidateOtp }" name="userId">
			<label >Password</label>
			<input type="password" id="pass" onkeyup=" check()" >
			<label for="password">Re-Enter Password</label>
			<input type="password" id="repass" name="password" onkeyup=" check()">
			<p id="demo"></p>
			<p id="demo1"></p>
			<button type="submit">Reset Password</button>
		</form>

		<p id="login_user">
			Already have an account?&nbsp;<a href="Userlogin.jsp">Sign in</a>
		</p>
		<p id="register_user">
			Don't have an account yet?&nbsp;<a href="userregister.jsp">Create
				Account</a>
		</p>


	</div>
	<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo1').innerHTML = 'please enter password';
			return false;
		} else if(pass.length <= 7 || repass.length <= 7) {
			document.getElementById('demo').innerHTML = 'Password must be 8 characters long';
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').style.color = 'red';
			return false;
		}else if((pass.length >= 7 || repass.length >= 7) && pass != repass) {
			document.getElementById('demo').innerHTML = 'Passwords doesn\'t match';
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').style.color = 'red';
			return false;
		}
		else{
			document.getElementById('demo1').innerHTML = '';
			document.getElementById('demo').innerHTML = 'Password matched';
			document.getElementById('demo').style.color = 'green';
			return true;
		}
	}
	
	setTimeout(() => {
		let get = document.getElementById('demo1');
		get.style.display = 'none';
		}, 5000);
	
</script>
</body>
</html>
<%

	

	
%>