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
	padding: 18px;
	box-shadow: 0 0 10px 5px #F6D7AF;
}

.header p {
	font-size: 26px;
	text-align: center;
	font-weight: 900;
	color: black;
}

.container {
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	width: 500px;
}

.f {
	width: 500px;
	box-shadow: 0 0 10px 2px #F6D7AF;
	border: 2px solid #F6D7AF;
	border-radius: 10px;
	transition-duration: 1s;
	margin: auto;
}



.container .login_header {
	text-align: center;
	color: black;
	font-weight: 900;
}

.container .form {
	margin-top: 10px;
	width: 480px;
	margin-left: auto;
	margin-right: auto;
	background-color: white;
	padding: 20px;
}

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
	margin: 15px 0;
	padding: 10px 8px;
	width: 100%;
	outline: none;
	background-color: transparent;
	border: 2px solid #CD8D7A;
	border-radius: 5px;
	font-size: 18px;
	transition: 0.34s;
	caret-color: #CD8D7A;
}

.form .input:focus {
	border: 2px solid #fffff7;
	box-shadow: 0 0 0 2px #CD8D7A;
}

.input::placeholder {
	font-size: 18px;
	opacity: 0.8;
}

.input:focus::placeholder {
	opacity: 0.6;
}

.show {
	color: black;
	font-size: 15px;
	cursor: pointer;
	margin: 0 auto;
	cursor: pointer;
	transition-duration: .4s;
}

.login_btn {
	display: block;
	margin: 8px 0;
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
	background-color: #DF826C;
	color: white;
	font-weight: 600;
}

.login_btn:hover {
	background-color: #e87256;
	color: white;
}

.new_user {
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
	cursor: pointer;
	transition-duration: 0.4s;
	color: #e87256;
}

.new_user .new_user_create .new_user_btn:hover {
	transform: scale(1.1);
	padding-left: 5px;
}



@media screen and (max-width: 600px) {
	.container {
		width: 320px;
	}
	.f {
		width: 300px;
	}
	.container .form {
		width: 280px;
	}
	.new_user {
		width: 300px;
	}
	.header p {
		font-size: 18px;
	}
}

#forgot {
	display: block;
	margin: auto;
	text-align: center;
	text-decoration: none;
	color: #DF826C;
	font-weight: 600;
	transition-duration: .4s;
	width: 200px;
}

#forgot:hover {
	transform: scale(1.10);
}

.back {
	width: 200px;
	margin: 20px auto;
}

.back_btn {
	display: block;
	margin: auto;
	width: 100%;
	background: white;
	padding: 10px;
	font-size: 18px;
	color: #df8263;
	cursor: pointer;
	transition-duration: .4s;
	border: 2px solid #df8263;
}

.back_btn:hover {
	background: #df8263;
	color: white;
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


</style>
</head>
<body onload="document.querySelector('.form').reset()">
	<div class="header">
		<p class="intro">Hospital Management System</p>
	</div>



	<div class="container">
		<div class="f">
			<form action="AdminValidateServlet" method="post" class="form">
				<c:if test="${adminLoginError != null }">


					<div class="error">Invalid username / password</div>
				</c:if>
				<c:if test="${adminGeneratedId != null }">
					<div class="error1">${adminGeneratedId}</div>
				</c:if>
				<c:if test="${adminPasswordChange != null }">
					<div id="mailSent">${adminPasswordChange}</div>
				</c:if>

				<c:if test="${adminForgotPasswordChangeError != null }">
					<div id="message">${adminForgotPasswordChangeError}</div>
				</c:if>
				<input type="text" maxlength="5" placeholder="Enter Admin Id"
					required class="input" name="adminid" pattern="[0-9]{5}"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
				<input type="password" name="password" placeholder="Enter Password"
					required class="input" id="myInput" /> <span class="show"
					onclick="showPassword()">Show password</span>
				<button type="submit" class="login_btn">Login</button>
			</form>
			<a href="admin-forgotpasswordotp.jsp" id="forgot">forgot
				password?</a>

			<div class="new_user">
				<form action="adminregister.jsp" method="POST"
					class="new_user_create">
					<p>
						Don't have a account?
						<button class="new_user_btn" type="submit">Create Account</button>
					</p>
				</form>
			</div>
		</div>


		<div class="back">
			<form action="HMS.jsp" method="POST">
				<button class="back_btn" type="submit">Back Home</button>
			</form>
		</div>
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
	</script>
</body>
</html>

<%
session.removeAttribute("userGeneratedId");
session.removeAttribute("errorMessage");
session.removeAttribute("userForgotPasswordChangeError");
session.removeAttribute("userPasswordChange");
%>
