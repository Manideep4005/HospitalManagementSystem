<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password | Hospital Management System</title>
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
	animation: button-loading-spinner 1s ease infinite;
}

@keyframes button-loading-spinner {from { transform:rotate(0turn);
	
}

to {
	transform: rotate(1turn);
}
}

#mailSent {
	margin: 10px auto;
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

#message {
	margin: 10px auto;
	
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
}
</style>

</head>
<body onload="document.querySelector('.f').reset();">

	<div class="header">
		<h2>Hospital Management System</h2>
	</div>

	<div class="container">
		<form action="UserForgotPasswordValidateOtp" method="POST" onsubmit="return check()" class="f">

			
			<c:if test="${userForgotOtpError != null}">
				<p id="message">${userForgotOtpError }</p>
			</c:if>
			
			<c:if test="${userOtpSentMail != null}">
				<p id="mailSent">${userOtpSentMail }</p>
			</c:if>

			<input type="text"
				inputmode="numeric" id="country_code" name="otp"
				pattern="[0-9]{6}"  maxlength="6" placeholder="Enter OTP"
				required
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" >

			<button type="submit" class="button">
				<span class="button__text">Validate</span>
			</button>
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
			 var btn = document.querySelector(".button");

		   		
		       
		   		if (true) {
		   			btn.classList.toggle("button--loading");
		   			btn.disabled = true;
		   		}
		       
		}
	
	</script>
	
</body>
</html>

<%session.removeAttribute("userForgotOtpError");%>