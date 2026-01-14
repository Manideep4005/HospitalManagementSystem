<<<<<<< HEAD
<%@page import="java.time.LocalDate"%>
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="userSessionValidate.jsp"%>

<%@page errorPage="userError.jsp"%>

<<<<<<< HEAD
<%
	String todayDate = LocalDate.now().toString();

	System.out.println(todayDate);
%>
=======

>>>>>>> e06896c5d3b881a587992830e685134132707732

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
<<<<<<< HEAD
	<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

<style>
* {
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
<<<<<<< HEAD
	padding: 0;
	margin: 0;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

body {
	font-size: 1em;
<<<<<<< HEAD
	 
}

 
=======
	margin: 0;
}

h1 {
	text-align: center;
	font-size: 2.5em;
	letter-spacing: 4px;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

#signUpForm {
	max-width: 500px;
	background-color: #ffffff;
<<<<<<< HEAD
	margin: 25px auto;
	padding: 40px;
	box-shadow: 0px 0px 0px 1px gainsboro;
=======
	margin: 15px auto;
	padding: 40px;
	box-shadow: 0px 0px 0px 2px gray;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	border-radius: 15px;
	transition: 0.34s;
}

#signUpForm:hover {
<<<<<<< HEAD
	box-shadow: 0px 0px 0px 2px gainsboro;
=======
	box-shadow: 0px 0px 0px 2px grey;
>>>>>>> e06896c5d3b881a587992830e685134132707732
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

<<<<<<< HEAD
input[type="date"] {
	cursor: pointer;
}

ul > li {
        list-style-type: none;
        list-style-position: inside;
      }

      ul > li > a {
        text-decoration: none;
        color: gray;
      }

      .overlay {
        background-color: rgb(89, 88, 88, 0.2);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        z-index: 5;
      }

      .header {
        padding: 10px;
        box-shadow: 0 0 5px 1px gainsboro;
        background: white;
        position: sticky;
        top: 0;
      }

      nav {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 0 10px;
      }

      .header img {
        max-width: 150px;
      }

      .username {
        display: flex;
        align-items: center;
        gap: 20px;
      }

      #home > li > a {
        border: 1px solid gray;
        padding: 5px;
      }

      #open-menu {
        font-size: 30px;
        cursor: pointer;
        color: gray;
      }

      .header-1-menu {
        display: none;
        position: absolute;
        width: 200px;
        padding: 10px;
        border: 1px solid gray;
        right: 10px;
        transition: 0.4s;
        background: white;
      }

      .sub-menu-1 {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .sub-menu-1 > .fa-user-circle {
        font-size: 20px;
        color: gray;
      }

      #menu-bar-hr {
        margin: 10px 0;
      }

      .sub-menu-2 > ul {
        display: flex;
        flex-direction: column;
        gap: 10px;
      }

      #account-settings {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      #account-settings a {
        text-decoration: none;
        color: gray;
      }

      .sub-menu {
      	background: white;
        overflow: hidden;
        display: none;
        flex-direction: column;
        position: absolute;
        right: 101%;
        top: 50%;
        width: 150px;
        padding: 8px;
        border: 1px solid gray;
        gap: 5px;
      }

      .display-sub-menu {
        display: flex;
      }

      /* Sidebar Styling */

      .side-bar-button {
        display: none;
      }

      #open-side-bar {
        font-size: 25px;
        color: gray;
        cursor: pointer;
      }

      .side-bar {
        background-color: white;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
        height: 100%;
        width: 0;
        z-index: 10;
        transition: 0.5s cubic-bezier(0.45, 0.45, 0.45, 0.45);
      }

      .close-side-bar {
        margin-top: 15px;
        display: flex;
        align-items: center;
        justify-content: flex-end;
      }

      #close-side-bar {
        font-size: 20px;
        cursor: pointer;
        color: gray;
      }

      .side-bar-user-info {
        margin-top: 20px;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .side-bar-user-info > .fa-user-circle {
        font-size: 20px;
        color: gray;
      }

      #side-bar-hr {
        margin: 15px 0;
      }

      .side-bar-links > ul {
        display: flex;
        flex-direction: column;
        gap: 15px;
        padding: 10px;
      }

      #side-bar-account-settings {
        display: flex;
        align-items: center;
        gap: 50px;
      }

      #side-bar-account-settings > i {
        transition: 0.4s;
      }

      #side-bar-account-settings a {
        color: gray;
        text-decoration: none;
      }

      .side-bar-sub-menu {
        display: none;
        transition: 0.4s;
        overflow: hidden;
        position: relative;
      }

      .side-bar-sub-menu > li {
        margin: 10px 0;
      }

      .side-bar-sub-menu-view {
        height: 100%;
        margin: 10px;
      }
      
      
      
      
      /* Book appointment modal */
   .overlay-2{
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

}


.modal {
	z-index: 12	;
	background: transparent;
	height: 100px;
	width: 100px;
	display: none;
 	justify-content: center;
 	align-items: center;
   position: absolute;
   left: 50%;
   top: 45%;
   transform: translate(-50%, -50%);

}

 
/* HTML: <div class="loader"></div> */
.loader {
  width: 80px;
  height: 80px;
  aspect-ratio: 1;
  --c1:linear-gradient(90deg,#0000 calc(100%/3),white 0 calc(2*100%/3),#0000 0);
  --c2:linear-gradient( 0deg,#0000 calc(100%/3),white 0 calc(2*100%/3),#0000 0);
  background: var(--c1),var(--c2),var(--c1),var(--c2);
  background-size: 300% 4px,4px 300%;
  background-repeat: no-repeat;
  animation: l3 1s infinite linear;
}
@keyframes l3 {
  0%   {background-position: 50%  0,100% 100%,0    100%,0 0}
  25%  {background-position: 0    0,100% 50% ,0    100%,0 0}
  50%  {background-position: 0    0,100% 0   ,50%  100%,0 0}
  75%  {background-position: 0    0,100% 0   ,100% 100%,0 50%}
 75.01%{background-position: 100% 0,100% 0   ,100% 100%,0 50%}
  100% {background-position: 50%  0,100% 0   ,100% 100%,0 100%}
}



 

      
@media screen and (max-width: 500px) {
        #home {
          display: none;
        }

        .user-logo {
          display: none;
        }

        .side-bar-button {
          display: block;
        }
      }
       

@media screen and (max-width:600px) {
	#signUpForm {
		max-width: 340px;
	}
	
=======
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
	  <div class="header">
      <nav>
        <div class="logo">
          <ul>
            <li>
              <a href="#"><img src="CSS/MANI_HOSPITAL.png" alt="" /></a>
            </li>
          </ul>
        </div>

        <div class="username">
          <ul id="home">
            <li><a href="usermodule.jsp">HOME</a></li>
          </ul>
          <div class="user-logo">
            <p><i class="fa fa-user-circle" id="open-menu"></i></p>
          </div>

          <div class="side-bar-button">
            <i class="fa fa-bars" id="open-side-bar"></i>
          </div>
        </div>
      </nav>
    </div>

   <!-- header 1 menu bar -->
    <div class="header-1-menu">
      <div class="sub-menu-1">
        <i class="fa fa-user-circle"></i>

        <p>${currentUserName}</p>
      </div>

      <hr id="menu-bar-hr" />

      <div class="sub-menu-2">
        <ul><li>Active Appointments (${activeUserAppointments })
          <li><a href="UserAppointmentHistoryServlet">Appointment History</a></li>
          <li>
            <div id="account-settings" class="dropdownbtn">
              <a href="#" class="dropdownbtn">Account Settings</a>
              <i class="fa fa-angle-right"> </i>
            </div>

            <ul class="sub-menu">
              <li><a href="UserProfileServlet">View Profile</a></li>

              <li><a href="UserProfileUpdateServlet">Update Profile</a></li>
              <li><a href="userChangePassword.jsp">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutUserServlet">Logout</a></li>
        </ul>
      </div>
    </div>

    <!-- SIDE BAR  -->

    <div class="side-bar">
      <div class="close-side-bar">
        <i class="fa fa-arrow-left" id="close-side-bar"></i>
      </div>
      <div class="side-bar-user-info">
        <i class="fa fa-user-circle"></i>
        <p>${currentUserName }</p>
      </div>
      <hr id="side-bar-hr" />
      <div class="side-bar-links">
        <ul><li>Active Appointments (${activeUserAppointments })
          <li>
            <a href="usermodule.jsp">Home</a>
          </li>
          <li><a href="UserAppointmentHistoryServlet">Appointment History</a></li>
          <li>
            <div id="side-bar-account-settings" class="side-bar-dropdown-btn">
              <a href="#" class="side-bar-dropdown-btn">Account Settings</a>
              <i class="fa fa-angle-right" id="side-bar-angle-right"> </i>
            </div>

            <ul class="side-bar-sub-menu">
              <li><a href="UserProfileServlet">View Profile</a></li>

              <li><a href="UserProfileUpdateServlet">Update Profile</a></li>
              <li><a href="userChangePassword.jsp">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutUserServlet">Logout</a></li>
        </ul>
      </div>
    </div>

    <div class="overlay"></div>
    <div class="overlay-2"></div>
    <div class="modal">
		 <div class="loader"></div>
	</div>


=======
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
	<form id="signUpForm" action="RegisterPatientServlet" method="post">
		<!-- start step indicators -->
		<div class="form-header">
			<span class="stepIndicator">Personal Info</span> <span
				class="stepIndicator">Contact Info</span> <span
<<<<<<< HEAD
				class="stepIndicator">Chek-up & Appointment Info</span>
=======
				class="stepIndicator">Chekup & Appointment Info</span>
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
				<input type="email" placeholder="E-mail (optional)"
					oninput="this.className = ''" name="email"  >
=======
				<input type="email" placeholder="E-mail"
					oninput="this.className = ''" name="email" class="one">
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
				<textarea placeholder="Symptoms (optional)" name="symptoms"
					oninput="this.className = ''" 
=======
				<textarea placeholder="Symptoms(400) Characters" name="symptoms"
					oninput="this.className = ''" class="one"
>>>>>>> e06896c5d3b881a587992830e685134132707732
					style="font-size: 18px; resize: none;" rows="1" cols="20"></textarea>
			</div>
			<div class="mb-15">
				<input type="text" required name="appointmentdate"
					  placeholder="Pick appointment date"
<<<<<<< HEAD
					oninput="this.className = ''" class="one" onfocus="(this.type='date')" min="<%= todayDate %>">
=======
					oninput="this.className = ''" class="one" onfocus="(this.type='date')">
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
			
			const modal = document.querySelector('.modal');
			const overlay_2 = document.querySelector('.overlay-2');
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
				modal.style.display = "flex";
				overlay_2.style.display = "block";
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
<<<<<<< HEAD
			
			
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
				
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD
		
		
		
		
	      function toggleMenu(event) {
	          event.preventDefault();
	          event.stopPropagation(); // Stop click from bubbling up

	          // Get the dropdown content and toggle display
	          // const dropdownContent = this.nextElementSibling;

	          const dropmenu = document.querySelector(".header-1-menu");
	          const isOpen = dropmenu.style.display === "block";

	          // Close all dropdowns
	          document.querySelector(".header-1-menu").style.display = "none";

	          // Toggle the clicked dropdown
	          dropmenu.style.display = isOpen ? "none" : "block";
	        }

	        function toggledropdown(event) {
	          event.preventDefault();
	          event.stopPropagation(); // Stop click from bubbling up

	          // Get the dropdown content and toggle display
	          // const dropdownContent = this.nextElementSibling;

	          const dropmenu = document.querySelector(".sub-menu");
	          const isOpen = dropmenu.style.display === "flex";

	          // Close all dropdowns
	          document.querySelector(".sub-menu").style.display = "none";

	          // Toggle the clicked dropdown
	          dropmenu.style.display = isOpen ? "none" : "flex";
	        }

	        function togglesidebarsubmenu(event) {
	          event.preventDefault();
	          event.stopPropagation(); // Stop click from bubbling up

	          // Get the dropdown content and toggle display
	          // const dropdownContent = this.nextElementSibling;

	          const dropmenu = document.querySelector(".side-bar-sub-menu");
	          const isOpen = dropmenu.style.display === "block";
	          const angle = document.querySelector("#side-bar-angle-right");
	          const angleRight =
	            document.querySelector("#side-bar-angle-right").style.transform ===
	            "rotate(90deg)";

	          // Close all dropdowns
	          document.querySelector(".side-bar-sub-menu").style.display = "none";
	          document.querySelector("#side-bar-angle-right").style.transform =
	            "none";

	          // Toggle the clicked dropdown
	          dropmenu.style.display = isOpen ? "none" : "block";
	          dropmenu.style.margin = "10px";
	          angle.style.transform = angleRight ? "none" : "rotate(90deg)";
	        }

	        function openSideBar() {
	          document.querySelector(".side-bar").style.width = "300px";
	          document.querySelector(".side-bar").style.padding = "20px";
	          overlay.style.display = "block";
	        }

	        function closeSideBar() {
	          document.querySelector(".side-bar").style.width = "0";
	          document.querySelector(".side-bar").style.padding = "0";
	          overlay.style.display = "none";
	        }

	        const openmenu = document.getElementById("open-menu");
	        const dropdownbtn = document.querySelectorAll(".dropdownbtn");
	        const sidebardropdownbtn = document.querySelectorAll(
	          ".side-bar-dropdown-btn"
	        );

	        const overlay = document.querySelector(".overlay");

	        openmenu.addEventListener("click", toggleMenu);

	        dropdownbtn.forEach((button) => {
	          button.addEventListener("click", toggledropdown);
	        });

	        sidebardropdownbtn.forEach((button) => {
	          button.addEventListener("click", togglesidebarsubmenu);
	        });

	        document
	          .getElementById("open-side-bar")
	          .addEventListener("click", openSideBar);

	        document
	          .getElementById("close-side-bar")
	          .addEventListener("click", closeSideBar);

	        overlay.addEventListener("click", closeSideBar);

	        document.addEventListener("click", () => {
	          console.log("document clicked");
	          document.querySelector(".header-1-menu").style.display = "none";
	          document.querySelector(".sub-menu").style.display = "none";
	        });

	        document.addEventListener("keydown", function (e) {
	          if (e.key === "Escape") {
	            closeSideBar();
	            document.querySelector(".header-1-menu").style.display = "none";
	            document.querySelector(".sub-menu").style.display = "none";
	          }
	        });
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</script>

</body>
</html>
