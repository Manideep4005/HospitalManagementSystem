<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page errorPage="userError.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | User Registration</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<<<<<<< HEAD
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
=======

>>>>>>> e06896c5d3b881a587992830e685134132707732


<style type="text/css">
* {
<<<<<<< HEAD
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: white;
	font-family: "Poppins", sans-serif;
}


.header {
	padding: 10px;
	position: sticky;
	top: 0;
	background: white;
	box-shadow: 0 0 4px gray;
}

.header > nav > .logo > img {
	max-width: 150px;
}

.header > nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 12px;
}

.links > a {
	text-decoration: none;
	background: transparent;
	transition: .4s;
	
	color: #3de3d7;
	border: 1px solid #3de3d7;
	font-size: 16px;
	padding: 8px;
	border-radius: 5px;
	box-shadow: 0 0 2px #3de3d7;
}

.links > a:hover {
	color: white;
	background: #3de3d7;
}
	 

#signin {
	background-color: #3de397;
	color: white;
	border-radius: 5px;
}

#signin:hover {
	background-color: tomato;
}

.fa-sign-in {
	font-size: 18px;
}

form {
	margin: 25px auto;
	max-width: 500px;
	padding: 20px;
	box-shadow: 0 0 0px 1px #abb4a7;
=======
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	margin: 0;
	background-color: white;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: transparent;
	border-bottom: 1px solid black;
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	transition: 0.34s ease;
	border-radius: 5px;
	font-weight: 500;
}

li a:hover {
	background-color: #a6a6a6;
	color: black;
}

.header p {
	color: black;
	text-align: center;
	margin-top: 0;
	font-weight: bolder;
	font-size: 18px;
	padding: 5px 0px;
}

.header {
	margin-top: 0;
	box-shadow: 0px 2px 0px 0px transparent;
	/*	background-color: #18191A;*/
}

#welcome {
	margin-top: 0;
	display: inline-block;
	color: white;
	text-align: center;
	padding: 10px 16px;
	font-weight: 1000;
	margin-left: 20.7%;
}

form {
	margin-left: auto;
	margin-right: auto;
	width: 550px;
	padding: 20px;
	box-shadow: 0 0 15px #abb4a7;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	border-radius: 8px;
	border: none;
	background-color: transparent;
	transition: 0.34s;
}

<<<<<<< HEAD
=======
form:hover {
	box-shadow: 0 0 0 2px #abb4a7;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

input, select, textarea {
	width: 100%;
	margin: 8px 0;
<<<<<<< HEAD
	padding: 10px;
=======
	padding: 12px 20px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	display: inline-block;
	border: 1px solid #a7b4b0;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
<<<<<<< HEAD
	font-size: 16px;
=======
	font-size: 18px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	transition: 0.34s ease;
}

input:hover, select:hover, textarea:hover {
	box-shadow: 0px 0px 0px 2px #b4a7ab;
}

input:focus, select:focus, textarea:focus {
	box-shadow: 0px 0px 0px 2px #b4a7ab;
}

input::placeholder, textarea::placeholder, select {
	color: gray;
}

input:focus::placeholder {
	opacity: 0.6;
}

select {
	background-color: transparent;
}

<<<<<<< HEAD
 

@media screen and (max-width: 600px) {

=======
/*button {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: block;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	font-size: 18px;
	border: none;
	transition-duration: .4s;
	background-color: #00008b;
	color: white;
	margin-left: auto;
	margin-right: auto;
	opacity: 0.8;
	cursor: pointer;
}

button:hover {
	opacity: 1;
}*/

@media screen and (max-width: 600px) {
	#welcome {
		margin-left: 10.7%;
	}
	form {
		width: 320px;
	}
	form:hover {
		padding: 20px;
	}
	ul {
		background-color: #f1f1f1;
		border-bottom: none;
	}
>>>>>>> e06896c5d3b881a587992830e685134132707732
	input::placeholder, textarea::placeholder, select {
		color: gray;
		font-size: 15px;
	}
	select {
		background-color: transparent;
	}
}

.optionColor {
	color: black;
}

#demo1, #demo2, #demo3, #demo4, #demo5, #demo6 {
	font-size: 15px;
	margin: 0;
	padding-left: 2%;
	color: red;
}

<<<<<<< HEAD
 
=======
a img {
	height: auto;
	width: 1em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 20px 5px;
	height: 100%;
}

.button-text:hover, .button-icon:hover {
	color: black;
}

.button-icon {
	font-size: 1.5em;
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
	font-weight: 1000;
	cursor: pointer;
	transition: 0.34s;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

#signUpForm input.invalid, #signUpForm textarea.invalid, #signUpForm select.invalid
	{
	border: 1px solid red;
}

.error {
	color: red;
}

.button {
	position: relative;
	padding: 12px 16px;
<<<<<<< HEAD
	background: dodgerblue;
=======
	background: #00008b;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	border: none;
	outline: none;
	border-radius: 2px;
	cursor: pointer;
	width: 100%;
	margin: 8px 0;
<<<<<<< HEAD
	color: white;
	font-size: 16px;
}


@keyframes spinner {
	
	0% {
		transform: rotate(0deg);
	}
	100% {
		transform: rotate(360deg);
	}
	
}




.overlay {
display: none;
	transition-duration:.4s;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(2px);
	z-index: 5;

}


.spinner {
display: none;
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 10;
  width: 80px;
  height: 80px;
  margin: -76px 0 0 -76px;
  border-radius: 50%;
  border: 3px dotted #3498db;
  border-top-color: #f3f3f3; 
  animation: spinner 1s linear infinite;
}

=======
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
</style>


</head>
<body onload="document.querySelector('.form').reset();">
<<<<<<< HEAD
			
	<div class="header">
		
		<nav>
			
			<div class="logo">
			<img alt="" src="CSS/MANI_HOSPITAL.png">
			</div>
			
			<div class="links">
				
				<a href="Userlogin.jsp">Sign in <i class="fa fa-sign-in"></i> </a>
				
			</div>
			
		</nav>
		
=======
	<div class="topnav">
		<ul>
			<li><a href="Userlogin.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<!-- <li id="welcome">Welcome Mani Hospitals</li> -->
			<li id="signin" style="float: right;"><a class="dropbtn"
				href="Userlogin.jsp"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text">Log in</span>
			</a></li>
		</ul>
	</div>

	<div class="header">
		<p>fill form to register</p>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>

	<div class="details_tab">
		<form method="post" onsubmit="return validateForm()"
			action="UserRegisterServlet" class="form" id="signUpForm">
			<p class="error">${userRegisterError}</p>
			<div class="personal">
				<input type="text" name="userfname" placeholder="First Name..."
					id="name" oninput="this.className = ''" class="one">
				<p id="demo1"></p>
				<input type="text" name="userlname" placeholder="Last Name..."
					id="lname" oninput="this.className = ''" class="one">
				<p id="demo1"></p>
				<select name="gender" id="gender" oninput="this.className = ''"
					class="one"
					onchange="this.className=this.options[this.selectedIndex].className">
					<option value="" disabled="disabled" selected="selected">---Gender---</option>
					<option value="male" class="optionColor">Male</option>
					<option value="female" class="optionColor">Female</option>
				</select>
				<p id="demo2"></p>
			</div>

			<div class="contact">
				<input type="email" name="email" placeholder="E-Mail..." id="mail"
					oninput="this.className = ''" class="one">
				<p id="demo3"></p>
				<input type="text" name="mobilenumber"
					placeholder="Mobile Number..." maxlength="10" id="contact"
					oninput="this.className = ''" class="one">
				<p id="demo4"></p>
				<textarea placeholder="Address(400) characters" name="address"
					id="address" rows="1" cols="20" style="resize: none;"
					oninput="this.className = ''" class="one"></textarea>
				<p id="demo5"></p>
			</div>


			<div class="pass">
				<input type="password" name="pass1" placeholder="Enter Password..."
					id="pass" oninput="this.className = ''" class="one"
					onkeyup="validatePassword()"> <input type="password"
					name="password" placeholder="Confirm Password..." id="repass"
					oninput="this.className = ''" class="one"
					onkeyup="validatePassword()">
				<p id="demo6"></p>
			</div>

			<button type="submit" class="button">
<<<<<<< HEAD
				Submit
			</button>
		</form>
	</div>
	
	<div class="modal">
		<div class="spinner"></div>
	</div>
	<div class="overlay"></div>
=======
				<span class="button__text">Submit</span>
			</button>
		</form>
	</div>

>>>>>>> e06896c5d3b881a587992830e685134132707732

	<script type="text/javascript">
	
		
		
		function validateForm() {
	        var y = document.getElementsByClassName("one");
	        var i,
	          valid = true;
<<<<<<< HEAD
	        const spinner = document.querySelector('.spinner');
	        const overlay = document.querySelector('.overlay');
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

	        for (i = 0; i < y.length; i++) {
	          if (y[i].value == "" ) {
	            y[i].className += " invalid";
	            valid = false;
	          }
	        }
	        
	        
	       var pass =  validatePassword();
	        
	       var final = valid && pass;
	       
<<<<<<< HEAD
=======
	       var btn = document.querySelector(".button");
>>>>>>> e06896c5d3b881a587992830e685134132707732

	   		
	       
	   		if (final) {
<<<<<<< HEAD
				spinner.style.display = "block";
				overlay.style.display = "block";
=======
	   			btn.classList.toggle("button--loading");
	   			btn.disabled = true;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	   		}
	       
	   		return final ;
	      }
		
		
		function validatePassword() {
			var pass = document.getElementById('pass').value;
			var repass = document.getElementById('repass').value;

			if (pass.length == 0 || repass.length == 0) {
				document.getElementById('demo6').innerHTML = '';
				return false;
			}
			else if (pass != repass) {
				document.getElementById('demo6').innerHTML = "password doesn\'t match";
				document.getElementById('demo6').style.color = 'red';
				return false;
			} else {
				document.getElementById('demo6').innerHTML = 'Password matched';
				document.getElementById('demo6').style.color = 'green';
				return true;
			}
		}
	</script>

</body>
</html>


<%
session.removeAttribute("userRegisterError");
%>