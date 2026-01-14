<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD

=======
	
>>>>>>> e06896c5d3b881a587992830e685134132707732
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>HMS | Create Account</title>
=======
<title>HMS | Admin Registration</title>
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
font-family: 'Poppins', sans-serif;
	background-color: #CAF4FF;
}

.header {
	position: sticky;
	top: 0;
	box-shadow: 0 0 3px 1px #f6d7ad;
	padding: 10px;
	background-color: #CAF4FF;
}

.header > nav {
	margin: 0 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.header > nav > img {
	max-width: 180px;
}


.header > nav > a {
	text-decoration: none;
	color: white;
	background: dodgerblue;
	font-size: 17px;
	padding: 10px;
	border-radius: 5px;
}

.fa-sign-in {
	font-size: 18px;
}

.details_tab {
	padding: 10px;
}

form {
	margin: 15px auto;
	max-width: 500px;
	padding: 30px;
	box-shadow: 0 0 2px 0px rgba(0, 0, 0, 0.5);
	border-radius: 2px;
	border: none;
	background-color: #fff;
	transition: 0.34s;
}

 
=======
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
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
	font-weight: 1000;
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
	border-radius: 8px;
	border: none;
	background-color: transparent;
	transition: 0.34s;
}

form:hover {
	 box-shadow: 0 0 0 2px #abb4a7;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

input, select, textarea {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
	border: 1px solid #a7b4b0;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	font-size: 18px;
	transition: 0.34s ease;
<<<<<<< HEAD
	background: transparent;
}

input:hover, select:hover, textarea:hover {
	box-shadow: 0px 0px 0px 1px #b4a7ab;
}

input:focus, select:focus, textarea:focus {
	box-shadow: 0px 0px 0px 1px #b4a7ab;
=======
}

 

input:hover, select:hover, textarea:hover {
	box-shadow: 0px 0px 0px 2px #b4a7ab;
}

input:focus, select:focus, textarea:focus {
	box-shadow: 0px 0px 0px 2px #b4a7ab;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

input::placeholder, textarea::placeholder, select {
	color: gray;
}

<<<<<<< HEAD
input:focus::placeholder {
=======
input:focus::placeholder{
>>>>>>> e06896c5d3b881a587992830e685134132707732
	opacity: 0.6;
}

select {
	background-color: transparent;
}

<<<<<<< HEAD
=======

 

>>>>>>> e06896c5d3b881a587992830e685134132707732
button {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: block;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	font-size: 18px;
	border: none;
	transition: 0.34s ease;
<<<<<<< HEAD
	background-color: dodgerblue;
	color: white;
	margin-left: auto;
	margin-right: auto;
=======
	background-color: #00008b;
	color: white;
	margin-left: auto;
	margin-right: auto;
	opacity: 0.8;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	cursor: pointer;
	transition-duration: 0.4s;
}

<<<<<<< HEAD
 

@media screen and (max-width: 600px) {
	 
	input::placeholder, textarea::placeholder, select {
		color: gray;
		font-size: 15px;
	}
	select {
		background-color: transparent;
	}
=======
button:hover {
	opacity: 1;
}

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
	
	input::placeholder, textarea::placeholder, select {
	color: gray;
	font-size: 15px;
}

select {
	background-color: transparent;

}
	
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
	width: 1.2em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 15px 5px;
	color: black;
	height: 100%;
	font-weight: 1000;
}

.button-text:hover, .button-icon:hover {
	color: black;
}

.button-icon {
	font-size: 1.5em;
	padding: 10px;
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

.optionColor {
	color: black;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

#signUpForm input.invalid, #signUpForm select.invalid, #signUpForm textarea.invalid {
	border: 1px solid red;
}
<<<<<<< HEAD
 

#error {
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
	margin: auto;
}

@keyframes spinner {
	
	from {
		transform: rotate(0turn);
	}
	to {
		transform: rotate(1turn);
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
	z-index: 10;
	overflow: hidden;
}


.loader {
display: none;
  align-items: center;
  justify-content: center;
  position: absolute;
  left: 50%;
  top: 45%;
  transform: translate(-50%, -50%);
  z-index: 10;
  width: 100px;
  height: 100px;
  background: transparent;
  
}

.spin {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border:4px solid white;
	border-top-color: dodgerblue;
	animation: spinner 1s linear infinite;
}

=======


.button {
	position: relative;
	padding: 12px 16px;
	background: #00008b;
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
>>>>>>> e06896c5d3b881a587992830e685134132707732

</style>

</head>
<body onload="document.querySelector('.registerForm').reset();">
<<<<<<< HEAD
 
 
 	<div class="header">
 		
 		<nav><img alt="" src="CSS/MANI_HOSPITAL.png">
 		
 		<a href="Adminlogin.jsp">Sign in <i class="fa fa-sign-in"></i></a></nav>
 		
 	</div>
 

	<div class="overlay"></div>
	
	<div class="loader">
		<div class="spin"></div>
=======
	<div class="topnav">
		<ul>
			<li><a href="Adminlogin.jsp" style="margin-left: 1px;">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<!-- <li id="welcome">Welcome Mani Hospitals</li> -->
			<li id="signin" style="float: right; "><a class="dropbtn"
				class="button-icon" href="Adminlogin.jsp"> <span
					class="button-icon"><img src="user3.png"></span> <span
					class="button-text">Log in</span>
			</a></li>
		</ul>
	</div>

	<div class="header">
		<p>fill details to register</p>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>

	<div class="details_tab">
		<form method="post" onsubmit="return validateForm()"
<<<<<<< HEAD
			action="AdminRegisterServlet" class="registerForm" id="signUpForm">
			<c:if test="${adminRegisterError != null}">
				<div id="error">${adminRegisterError}</div>
			</c:if>

=======
			action="AdminRegisterServlet"   class="registerForm" id="signUpForm">
			<c:if test="${adminRegisterError != null }">
							<div class="error">adminRegisterError</div>
						</c:if>
						
>>>>>>> e06896c5d3b881a587992830e685134132707732
			<div class="personal">
				<input type="text" name="adminfname" placeholder="First Name..."
					id="name" class="one" oninput="this.className = ''">
				<p id="demo1"></p>
				<input type="text" name="adminlname" placeholder="Last Name..."
					id="lname" class="one" oninput="this.className = ''">
				<p id="demo1"></p>
<<<<<<< HEAD
				<select name="gender" id="gender" class="one"
					oninput="this.className = ''"
					onchange="this.className=this.options[this.selectedIndex].className">
=======
				<select name="gender" id="gender"  class="one" oninput="this.className = ''" onchange="this.className=this.options[this.selectedIndex].className">
>>>>>>> e06896c5d3b881a587992830e685134132707732
					<option value="" disabled="disabled" selected="selected">---Gender---</option>
					<option value="male" class="optionColor">Male</option>
					<option value="female" class="optionColor">Female</option>
				</select>
				<p id="demo2"></p>
			</div>

			<div class="contact">
<<<<<<< HEAD
				<input type="email" name="email" placeholder="E-Mail..." id="mail"
					class="one" oninput="this.className = ''">
				<p id="demo3"></p>
				<input type="text" name="mobilenumber"
					placeholder="Mobile Number..." maxlength="10" id="contact"
					class="one" oninput="this.className = ''">
				<p id="demo4"></p>
				<textarea placeholder="Address(400) characters" name="address"
					id="address" rows="1" cols="20" style="resize: none;" class="one"
					oninput="this.className = ''"></textarea>
=======
				<input type="email" name="email" placeholder="E-Mail..." id="mail" class="one" oninput="this.className = ''">
				<p id="demo3"></p>
				<input type="text" name="mobilenumber"
					placeholder="Mobile Number..." maxlength="10" id="contact" class="one" oninput="this.className = ''">
				<p id="demo4"></p>
				<textarea placeholder="Address(400) characters" name="address"
					id="address" rows="1" cols="20" style="resize: none;" class="one" oninput="this.className = ''"></textarea>
>>>>>>> e06896c5d3b881a587992830e685134132707732
				<p id="demo5"></p>
			</div>


			<div class="pass">
				<input type="password" name="pass1" placeholder="Enter Password..."
<<<<<<< HEAD
					id="pass" class="one" oninput="this.className = ''"> <input
					type="password" name="password" placeholder="Confirm Password..."
					id="repass" onkeyup="validatePassword()" class="one"
					oninput="this.className = ''">
				<p id="demo6"></p>
			</div>

			<button type="submit"  >
				 Register
=======
					id="pass" class="one" oninput="this.className = ''"> <input type="password" name="password"
					placeholder="Confirm Password..." id="repass" onkeyup="validatePassword()" class="one" oninput="this.className = ''">
				<p id="demo6"></p>
			</div>

			<button type="submit" class="button">
				<span class="button__text">Submit</span>
>>>>>>> e06896c5d3b881a587992830e685134132707732
			</button>
		</form>
	</div>


	<script type="text/javascript">

	function validateForm() {
        var y = document.getElementsByClassName("one");
        var i,
          valid = true;

        for (i = 0; i < y.length; i++) {
          if (y[i].value == "" ) {
            y[i].className += " invalid";
            valid = false;
          }
        }
        
<<<<<<< HEAD
        const overlay = document.querySelector('.overlay');
        const loader = document.querySelector('.loader');
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
        
       var pass =  validatePassword();
        
       var final = valid && pass;
       
       var btn = document.querySelector(".button");

   		
       
   		if (final) {
<<<<<<< HEAD
   			overlay.style.display = "block";
   			loader.style.display = "flex";
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
		} else if (repass.length <= 7) {
			document.getElementById('demo6').innerHTML = 'password must be 8 characters';
			document.getElementById('demo6').style.color = 'red';
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
<<<<<<< HEAD
</html>

<%session.removeAttribute("adminRegisterError");%>
=======
</html>
>>>>>>> e06896c5d3b881a587992830e685134132707732
