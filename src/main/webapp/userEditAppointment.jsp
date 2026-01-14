<%@page import="com.hms.db.CurrentDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%
	String todayDate = LocalDate.now().toString();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment History | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style type="text/css">
* {
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
	margin: 0;
	padding: 0;
}

body {
	background: white;
}

ul>li {
	list-style-type: none;
	list-style-position: inside;
}

ul>li>a {
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
	background: white;
	top: 0;
	position: sticky;
	box-shadow: 0 0 5px 1px gainsboro;
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

#home>li>a {
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

.sub-menu-1>.fa-user-circle {
	font-size: 20px;
	color: gray;
}

#menu-bar-hr {
	margin: 10px 0;
}

.sub-menu-2>ul {
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

.side-bar-user-info>.fa-user-circle {
	font-size: 20px;
	color: gray;
}

#side-bar-hr {
	margin: 15px 0;
}

.side-bar-links>ul {
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

#side-bar-account-settings>i {
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

.side-bar-sub-menu>li {
	margin: 10px 0;
}

.side-bar-sub-menu-view {
	height: 100%;
	margin: 10px;
}

.container {
	max-width: 500px;
	margin: 10px auto;
	border: 1px solid gainsboro;
	border-radius: 5px;
	box-shadow: 0 0 2px gainsboro; 
}

.container > form {
	display: flex;
	flex-direction: column;
	gap: 15px;
	padding: 20px;
} 


.container > form > input {
	padding: 10px;
	outline: none;
	border-radius: 5px;
	font-size: 14px;
	border: 1px solid gray;
	color: grey;
}

 

.container > form > select {

	padding: 10px;
	outline: none;
	border-radius: 5px;
	font-size: 14px;
	border: 1px solid gray;
	color: grey;

}

.container > form > textarea {
	padding: 10px;
	outline: none;
	border-radius: 5px;
	font-size: 14px;
	border: 1px solid gray;
	color: grey;
	resize: none;
}
 
 .container > form > input:focus, .container > form > select:focus, .container > form > textarea:focus {
 	transition: .4s;
 	border-color: dodgerblue;
 }
 
 .container > form > button {
 	padding: 10px;
 	font-size: 14px;
 	border-radius: 5px;
 	cursor: pointer;
 	outline: none;
 	background: grey;
 	color: white;
 	border: 1px solid transparent;
 		transition: .4s;
 }
 
 .container > form > button:hover {
 
 	background: #a1a1a1;
 }


.back {
	margin: 20px auto;
	max-width: 100px;
}

.back p {
	text-align: center;
}

.back a {
	display: inline-block;
	text-align: center;
	text-decoration: none;
	color: black;
	font-size: 15px;
	cursor: pointer;
	border: 2px solid;
	border-color: transparent;
	transition: 0.4s ease;
}

.back a:hover {
	border-bottom-color: gray;
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
</style>
</head>


<body>
	<div class="header">
		<nav>
			<div class="logo">
				<ul>
					<li><a href="#"><img src="CSS/MANI_HOSPITAL.png" alt="" /></a>
					</li>
				</ul>
			</div>

			<div class="username">
				<ul id="home">
					<li><a href="usermodule.jsp">HOME</a></li>
				</ul>
				<div class="user-logo">
					<p>
						<i class="fa fa-user-circle" id="open-menu"></i>
					</p>
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
			<ul>
				<li>Active Appointments (${activeUserAppointments })
				<li><a href="UserAppointmentHistoryServlet">Appointment
						History</a></li>
				<li>
					<div id="account-settings" class="dropdownbtn">
						<a href="#" class="dropdownbtn">Account Settings</a> <i
							class="fa fa-angle-right"> </i>
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
			<ul>
				<li>Active Appointments (${activeUserAppointments })
				<li><a href="usermodule.jsp">Home</a></li>
				<li><a href="UserAppointmentHistoryServlet">Appointment
						History</a></li>
				<li>
					<div id="side-bar-account-settings" class="side-bar-dropdown-btn">
						<a href="#" class="side-bar-dropdown-btn">Account Settings</a> <i
							class="fa fa-angle-right" id="side-bar-angle-right"> </i>
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

	<div class="container">
			
			<form action="UserUpdateAppointment" method="POST">
				
				<c:forEach items="${editAppointment }" var="a">
					
					<input type="hidden" value="${a.appointmentId }" name="appid" required>
					<input type="hidden" value="${a.patientId }" name="pid" required>
					<input type="text" name="pfname" value="${a.patientFirstName }" placeholder="First Name" required>
					<input type="text" name="plname" value="${a.patientLastName }" placeholder="Last Name" required>
					
					<select name="gender" required>
						<option value="${a.gender }">${a.gender }</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
					<input type="text" name="age" placeholder="Age" value="${a.age }" required>
					
					<input type="email" value="${a.email }" name="email" placeholder="Email (Optional)">
					<input type="text" value="${a.contact }" name="contact" placeholder="Mobile Number" required >
					<textarea rows="4" cols="" name="address">${a.address }</textarea>
					
					
					<select name="checkup" required="required">
					<option value="${a.checkup }" selected="selected">${a.checkup }</option>
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
					
				<input type="text"  placeholder="Symptoms (Optional)" name="symptoms" value="${a.symptoms }">
					
				<input type="text" required name="appointmentdate"
       placeholder="Pick appointment date"
       onfocus="(this.type='date')" 
       onblur="if(!this.value) this.type='text'" 
       min="<%= todayDate %>" value="${a.appointmentDate }">
				
					
					
				</c:forEach>
				
				<button type="submit">Update</button>
			</form>
		
	</div>


	<div class="back">
		<p>
			<a href="UserAppointmentHistoryServlet">Go Back</a>
		</p>
	</div>

	<script type="text/javascript">
	
	
	
	
	
	
	
	

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
      document.querySelector(".overlay-2").style.display="none";
      document.querySelector(".cancel-modal").style.display="none";
    }
  });
  
  
  
 
 
 document.querySelector(".overlay-2").addEventListener('click', () => {
	 document.querySelector(".overlay-2").style.display="none";
     
 });
 


</script>
</body>
</html>
