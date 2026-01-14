<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login | HMS</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	background: white;
}

.header {
<<<<<<< HEAD
	padding: 15px;
	box-shadow: 0 0 1px 0px #45a29e;
}

.logo img {
	max-width: 150px;
=======
	padding: 18px;
	box-shadow: 0 0 10px #45a29e;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

.header p {
	font-size: 20px;
	text-align: center;
	font-weight: 900;
	color: black;
}


.container {
	width: 500px;
<<<<<<< HEAD
	top: 45%;
=======
	top: 50%;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	
}

.f {
<<<<<<< HEAD
	box-shadow: 0 0 2px 1px #9ad0c2;
	padding: 25px;
	border-radius: 10px;
}
 
=======
	box-shadow: 0 0 20px #9ad0c2;
	padding: 20px;
	border-radius: 10px;
}

.container .login_header {
	text-align: center;
	color: black;
	font-weight: 900;
}

.container .form {
	margin-top: 10px;
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	background-color: white;
	border-radius: 10px;
	
}

>>>>>>> e06896c5d3b881a587992830e685134132707732
.container .form label {
	display: block;
	margin: 8px 0;
	padding: 2px 0px;
	font-size: 18px;
	font-weight: 600;
	color: black;
}

.container .form .input {
	display: block;
<<<<<<< HEAD
	margin: 15px 0;
	padding: 10px;
=======
	margin: 12px 0;
	padding: 10px 8px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	width: 100%;
	outline: none;
	background-color: transparent;
	border: 2px solid #adcbd7;
	border-radius: 5px;
<<<<<<< HEAD
	font-size: 15px;
=======
	font-size: 18px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	transition: 0.34s;
}

.form .input:focus {
	border: 2px solid #fffff7;
	box-shadow: 0 0 0 2px #adcbd7;
}

.input::placeholder {
<<<<<<< HEAD
	font-size: 15px;
=======
	font-size: 18px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	opacity: 0.8;
}

.input:focus::placeholder {
	opacity: 0.6;
}

.show {
	color: black;
	font-size: 15px;
	cursor: pointer;
	margin: 0 5px;
	cursor: pointer;
	transition-duration: .4s;
}

.login_btn {
	display: block;
<<<<<<< HEAD
	margin: 12px 0;
=======
	margin: 8px 0;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	border: none;
	padding: 10px 8px;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
	border-radius: 3px;
	border: 2px solid transparent;
	background-color: #45a29e;
	color: white;
	font-weight: 600;
}

.login_btn:hover {
<<<<<<< HEAD
	background-color: #45b29e;
=======
	background-color: dodgerblue;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	color: white;
}

.new_user {
<<<<<<< HEAD
	margin: 20px auto;
	text-align: center;
}

.new_user > p > a {
	color: #45a29e;
	cursor: pointer;
	
}



 

=======
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	width: 400px;
}

.new_user .new_user_create p {
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	margin: 15px 0;
}

.new_user .new_user_create .new_user_btn {
	border: none;
	background-color: transparent;
	font-size: 18px;
	font-weight: 800;
	cursor: pointer;
	transition-duration: 0.4s;
}

.new_user .new_user_create .new_user_btn:hover {
	text-decoration: underline;
	transform: scale(1.1);
	padding-left: 5px;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732



@media screen and (max-width: 600px) {
	.container {
		width: 350px;
		padding: 10px;
	}
<<<<<<< HEAD
	
	
	.logo img {
		max-width: 130px;
=======
	.container .form {
		width: 300px;
	}
	.new_user {
		width: 300px;
	}
	.header p {
		font-size: 18px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	}
}


#forgot {
	display: block;
	margin: 15px auto;
	text-align: center;
	text-decoration: none;
<<<<<<< HEAD
	color: #45a29e;
=======
	color: black;
	font-weight: 800;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	transition-duration: .4s;
	width: 200px;
}

#forgot:hover {
<<<<<<< HEAD
	transform: scale(1.02);
=======
	transform: scale(1.10);
	text-decoration: underline;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

#mailSent, .error1 {
	margin: 10px auto;
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

#message, .error {
	margin: 10px auto;
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
}

.back {
	width: 200px;
	margin: 20px auto;
	
}

.back button {
	display: block;
	margin: auto;
	width: 100%;
	font-size: 18px;
	padding: 10px 0;
	background: white;
	border: 2px solid #45a29e;
	color : #45a29e;
	transition-duration: .4s;
	cursor: pointer;
}

.back button:hover {
	background: #45a29e;
	color: white;
}

</style>
</head>
<body onload="document.querySelector('.form').reset()">
<<<<<<< HEAD
	
	<div class="header"> 
		<div class="logo">
			<img alt="" src="CSS/MANI_HOSPITAL.png">
		</div>
=======
	<div class="header">
		<p class="intro">Welcome to Hospital Management System</p>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>

	

	<div class="container">
		<div class="f">
			<form action="UserValidateServlet" method="post" class="form">
				<c:if test="${errorMessage != null }">
<<<<<<< HEAD
					<div class="error">${errorMessage}</div>
=======
					<div class="error">Invalid user id / password</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732
				</c:if>
				<c:if test="${userGeneratedId != null }">
					<div class="error1">${userGeneratedId}</div>
				</c:if>
				<c:if test="${userPasswordChange != null }">
					<div class="error1">${userPasswordChange}</div>
				</c:if>
				
				<c:if test="${userForgotPasswordChangeError != null }">
					<div class="error">${userForgotPasswordChangeError}</div>
				</c:if>
<<<<<<< HEAD
				 <input type="email"  
					placeholder="User name or Email" required class="input" name="userid"  autocomplete="off">
				 <input type="password" autocomplete="off"
					name="password" placeholder="Password" required class="input"
					id="myInput" /> <!--  <span class="show" onclick="showPassword()">Show
					password</span>-->
=======
				 <input type="text" maxlength="5"
					placeholder="Enter user Id" required class="input" name="userid" />
				 <input type="password"
					name="password" placeholder="Enter Password" required class="input"
					id="myInput" /> <span class="show" onclick="showPassword()">Show
					password</span>
>>>>>>> e06896c5d3b881a587992830e685134132707732
				<button type="submit" class="login_btn">Login</button>
			</form>
			<a href="user-forgotpasswordotp.jsp" id="forgot">forgot password?</a>
		
<<<<<<< HEAD
		
		</div>
		<div class="new_user">
				<p>
					Don't have an account?&nbsp;
					<a class="new_user_btn" onclick="navigate('userregister.jsp')">Create Account</a>
				</p>
		</div>
		<!--<div class="back">
			<form action="HMS.jsp" method="post">
				<button>Back Home</button>
			</form>
		</div>-->
=======
		<div class="new_user">
			<form action="userregister.jsp" method="POST" class="new_user_create">
				<p>
					Don't have a account
					<button class="new_user_btn" type="submit">create</button>
				</p>
			</form>
		</div>
		</div>
		
		<div class="back">
			<form action="HMS.jsp" method="post">
				<button>Back Home</button>
			</form>
		</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>

	<!-- 
        JavaScript Validations
    -->
	<script>
		function showPassword() {
			var x = document.getElementById("myInput");
			if (x.type === "password") {
				x.type = "text";
				document.querySelector('.show').textContent = "Hide password";
				document.querySelector('.show').style.color = "red";
			} else {
				x.type = "password";
				document.querySelector('.show').textContent = "Show password";
				document.querySelector('.show').style.color = "black";
			}

		}
<<<<<<< HEAD
		
		
		function navigate(url) {
			window.location.href = url;
		}
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</script>
</body>
</html>

<%session.removeAttribute("userGeneratedId");
session.removeAttribute("errorMessage");
session.removeAttribute("userForgotPasswordChangeError");
session.removeAttribute("userPasswordChange");%>
