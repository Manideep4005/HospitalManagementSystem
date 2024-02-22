<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="userSessionValidate.jsp"%>

<%@page errorPage="userError.jsp"%>



<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<title>Appointment Form | HMS</title>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style>
* {
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
}

body {
	font-size: 1em;
	margin: 0;
}

h1 {
	text-align: center;
	font-size: 2.5em;
	letter-spacing: 4px;
}

#signUpForm {
	max-width: 500px;
	background-color: #ffffff;
	margin: 15px auto;
	padding: 40px;
	box-shadow: 0px 0px 0px 2px gray;
	border-radius: 15px;
	transition: 0.34s;
}

#signUpForm:hover {
	box-shadow: 0px 0px 0px 2px grey;
}

#signUpForm .form-header {
	display: flex;
	gap: 5px;
	text-align: center;
	font-size: .9em;
}

#signUpForm .form-header .stepIndicator {
	position: relative;
	flex: 1;
	padding-bottom: 30px;
}

#signUpForm .form-header .stepIndicator.active {
	font-weight: 600;
}

#signUpForm .form-header .stepIndicator.finish {
	font-weight: 600;
	color: #009688;
}

#signUpForm .form-header .stepIndicator::before {
	content: "";
	position: absolute;
	left: 50%;
	bottom: 0;
	transform: translateX(-50%);
	z-index: 9;
	width: 15px;
	height: 15px;
	background-color: #d5efed;
	border-radius: 50%;
	border: 3px solid #ecf5f4;
}

#signUpForm .form-header .stepIndicator.active::before {
	background-color: #a7ede8;
	border: 3px solid #d5f9f6;
}

#signUpForm .form-header .stepIndicator.finish::before {
	background-color: #009688;
	border: 3px solid #b7e1dd;
}

#signUpForm .form-header .stepIndicator::after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: 9px;
	width: 100%;
	height: 3px;
	background-color: #f3f3f3;
}

#signUpForm .form-header .stepIndicator.active::after {
	background-color: #a7ede8;
}

#signUpForm .form-header .stepIndicator.finish::after {
	background-color: #009688;
}

#signUpForm .form-header .stepIndicator:last-child:after {
	display: none;
}

#signUpForm p {
	text-align: center;
	margin-bottom: 25px;
}

.mb-15 {
	margin-bottom: 15px;
}

#signUpForm input, #signUpForm select, #signUpForm textarea {
	padding: 15px 20px;
	width: 100%;
	font-size: 1em;
	border: 2px solid gainsboro;
	border-radius: 5px;
	color: gray;
	transition: 0.34s;
}

#signUpForm input:focus, #signUpForm textarea:focus, #signUpForm select:focus
	{
	border: 2px solid #009688;
	outline: 0;
}

#signUpForm input.invalid, #signUpForm select.invalid, #signUpForm textarea.invalid
	{
	border: 2px solid #ffaba5;
}

#signUpForm .step {
	display: none;
}

#signUpForm .form-footer {
	overflow: auto;
	display: flex;
	gap: 20px;
}

#signUpForm .form-footer button {
	background-color: #009688;
	border: 1px solid #009688 !important;
	color: #ffffff;
	border: none;
	padding: 13px 30px;
	font-size: 1em;
	cursor: pointer;
	border-radius: 5px;
	flex: 1;
	margin-top: 5px;
}

#signUpForm .form-footer button:hover {
	opacity: 0.8;
}

#signUpForm .form-footer #prevBtn {
	background-color: #fff;
	color: #009688;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1.8px solid black;
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
	font-weight: 300;
	transition: 0.1s ease;
	font-weight: 1000;
}

li a:hover, .dropdown:hover {
	background-color: #a8a8a8;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -20px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 10px;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 300;
}

.dropdown-content a:hover {
	background-color: #d3d3d3;
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
	font-weight: 1000;
}

.dropbtn span {
	font-weight: 1000;
	color: black;
}

.dropbtn span:hover {
	font-weight: 1000;
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
	padding: 15px 5px;
	color: black;
	height: 100%;
	font-weight: 1000;
}

.button-text:hover {
	
}

.button-icon {
	font-size: 1.5em;
}

@media screen and (max-width:600px) {
	#signUpForm {
		max-width: 320px;
	}
	li a {
		padding: 10px 5px;
	}
	select {
		background-color: transparent;
	}
}

.back button {
	background-color: #009688;
	border: 1px solid #009688 !important;
	color: #ffffff;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.34s ease;
	display: block;
	margin-left: auto;
	margin-right: auto;
	font-size: 16px;
	font-weight: 600;
	width: 20%;
}

.back button:hover {
	background-color: #537895;
	color: white;
}
</style>
<body>
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("currentUserName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("userAccountId")%></a> <a
						href="userdetails.jsp">My Account</a> <a
						href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<h1>Book Appointment</h1>
	<form id="signUpForm" action="RegisterPatientServlet" method="post">
		<!-- start step indicators -->
		<div class="form-header">
			<span class="stepIndicator">Personal Info</span> <span
				class="stepIndicator">Contact Info</span> <span
				class="stepIndicator">Chekup & Appointment Info</span>
		</div>
		<!-- end step indicators -->

		<!-- step one -->
		<div class="step">
			<p>Enter Personal Details</p>
			<div class="mb-15">
				<input type="text" placeholder="First name"
					oninput="this.className = ''" name="pfname" class="one">
			</div>
			<div class="mb-15">
				<input type="text" placeholder="Last name"
					oninput="this.className = ''" name="plname" class="one">
			</div>
			<div class="mb-15">
				<select name="gender" required oninput="this.className = ''"
					class="one">
					<option value="">Select Gender</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</div>
			<div class="mb-15">
				<input type="text" placeholder="Enter Age"
					oninput="this.className = ''" name="birth" class="one" id="age">

			</div>
		</div>

		<!-- step two -->
		<div class="step">
			<p>Enter Contact Details</p>
			<div class="mb-15">
				<input type="email" placeholder="E-mail"
					oninput="this.className = ''" name="email" class="one">
			</div>
			<div class="mb-15">
				<input type="text" placeholder="Contact"
					oninput="this.className = ''" name="mobilenumber" maxlength="10"
					class="one">
			</div>
			<div class="mb-15">
				<textarea placeholder="Address(400) Characters" name="address"
					oninput="this.className = ''" class="one"
					style="font-size: 18px; resize: none;" rows="1" cols="20"></textarea>
			</div>
		</div>

		<!-- step three -->
		<div class="step">
			<p>Check-up type and Booking Date</p>
			<div class="mb-15">
				<select name="checkup" oninput="this.className = ''" class="one">
					<option value="" selected="selected" disabled="disabled">----check-up Type-----</option>
					<option value="general physician">General Physician</option>
					<option value="cardiologist">Cardiologist</option>
					<option value="dermetalogist">Dermatologist</option>
					<option value="orthopedic">Orthopedic</option>
					<option value="gastroenterologist">Gatroenterologist</option>
					<option value="diabetic">Diabetics</option>
					<option value="anesthesiologists">Anesthesiologists</option>
					<option value="neurologists">Neurologists</option>
					<option value="pediatric">Pediatric</option>
					<option value="pulmonologist">Pulmonologist</option>
					<option value="urologist">Urologist</option>
				</select>
			</div>
			<div class="mb-15">
				<textarea placeholder="Symptoms(400) Characters" name="symptoms"
					oninput="this.className = ''" class="one"
					style="font-size: 18px; resize: none;" rows="1" cols="20"></textarea>
			</div>
			<div class="mb-15">
				<input type="text" required name="appointmentdate"
					  placeholder="Pick appointment date"
					oninput="this.className = ''" class="one" onfocus="(this.type='date')">
			</div>
		</div>

		<!-- start previous / next buttons -->
		<div class="form-footer">
			<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
			<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
		</div>
		<!-- end previous / next buttons -->
	</form>

	<div class="back">
		<form action="usermodule.jsp" method="post">
			<button type="submit">Back</button>
		</form>
	</div>

	<script type="text/javascript">
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the current tab

		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("step");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("step");
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("signUpForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("step");
			y = x[currentTab].getElementsByClassName("one");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("stepIndicator")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("stepIndicator");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>

</body>
</html>
