<<<<<<< HEAD
<%@page import="com.hms.db.CurrentDate"%>
<%@page import="java.sql.Date"%>
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<<<<<<< HEAD
<%@page errorPage="userError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



=======
<%@page errorPage="userError.jsp" %>
<%
Integer id = (Integer) session.getAttribute("userAccountId");
String userName = (String) session.getAttribute("currentUserName");
%>

<%
Integer userId = 0;

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where user_id = ?");
pstmt.setInt(1, id);

ResultSet rs1 = pstmt.executeQuery();

while (rs1.next()) {
	userId = rs1.getInt("user_id");
}

ResultSet rs2 = pstmt.executeQuery();
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment History | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<<<<<<< HEAD
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
=======

>>>>>>> e06896c5d3b881a587992830e685134132707732
<style type="text/css">
* {
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
<<<<<<< HEAD
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
	font-size: 15px;
	max-width: 650px;
	overflow: auto;
	margin: 20px auto;
	padding: 0px 10px;
	box-shadow: 0 0 5px 1px gainsboro;
}

.container>.tabs {
	box-shadow: 0 0 1px 1px gainsboro;
	padding: 20px;
	margin: 12px auto;
	max-width: 500px;
	background:#90EE90;
	background-blend-mode: screen;
	border-radius: 5px;
}

.container>.tabs>p {
	margin: 5px 0;
	font-weight: 500;
}

.container>.tabs>p>span {
	font-weight: 600;
}

.container>.tabs>div {
	display: flex;
	gap: 20px;
}


.container > .tabs > div > a {
	text-decoration: none;
	border: 1px solid;
	padding: 5px;
}


#edit {
	border-color: dodgerblue;
	color: white;
	background: dodgerblue;
}

#delete {
	border-color:red;
	color: white;
	background: red;
}

.container>.closed {
	box-shadow: 0 0 1px 1px gainsboro;
	padding: 20px;
	margin: 12px auto;
	max-width: 500px;
	background:#FF999C;
	background-blend-mode: screen;
	border-radius: 5px;
	cursor: not-allowed;
}

.container>.closed>p {
	margin: 5px 0;
	font-weight: 500;
}

.container>.closed>p>span {
	font-weight: 600;
}

#active {
	color: limegreen;
}

 

.container::-webkit-scrollbar {
	width: 10px;
	height: 0px;
}

 
.overlay-2 {
	display: none;
	background: rgba(0, 0, 0, 0.4);
	z-index: 8;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	backdrop-filter: blur(5px);
=======
}

body {
	margin: 0;
	background:  #F7F7F7;
}

.header {
	text-align: center;
	padding: 5px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin-top: 2%;
	font-weight: bolder;
	font-size: 18px;
	color: #34495E;
	text-decoration: underline;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: #f7f7f7;
	box-shadow: 0 0 10px 1px grey;
	/*position: fixed;
    width: 100%;*/
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
	font-weight: bold;
	transition: 0.1s ease;
	font-weight: 600;
}

li a:hover, .dropdown:hover {
	background-color: #BEC3C7;
	color: black;
	
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
	margin-left: -10px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 450;
}

.dropdown-content a:hover {
	background-color: #778899;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 38.6px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
	font-weight: 300;
}

.dropbtn span {
	font-weight: 1000;
	color: black;
}

a img {
	height: auto;
	width: 1.2em;
	display: flex;
}

.button-text, .button-icon {
	display: inline-flex;
	align-items: center;
	padding: 18px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}

.column {
	border: 1px solid red;
	height: auto;
}

.history {
	margin-top: 2%;
}

.patient_details p {
	/*    	margin: 0;*/
	font-size: 20px;
	font-weight: 500;
	padding-left: 20px;
}

.scroll {
	margin-top: 2%;
	overflow-y: auto;
	height: 500px;
}

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 1%;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 10px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 10px;
	font-size: 18px;
	border: 1px solid #ccc;
}

h1 {
	text-align: center;
	color: #60FD00;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

.back p {
	text-align: center;
}

.back a {
	display: inline-block;
	text-align: center;
	text-decoration: underline;
	color: black;
	font-size: 18px;
	cursor: pointer;
	transition: 0.4s ease;
}

.back a:hover {
	text-decoration: underline;
}

<<<<<<< HEAD
/* Modal background */
  .modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    justify-content: center;
    align-items: center;
  }

  /* Modal box */
  .modal-content {
  
    background: white;
    padding: 20px;
    border-radius: 10px;
    width: 300px;
    text-align: center;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }

  /* Close button */
  .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    cursor: pointer;
  }

  /* Buttons */
  .modal-buttons {
    margin-top: 15px;
    display: flex;
    justify-content: space-around;
  }

  button, .yes-btn {
    padding: 8px 15px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
  }

  button {
    background: red;
    color: white;
  }

  .yes-btn {
    background: green;
    color: white;
    text-decoration: none;
  }

  button:hover {
    background: darkred;
  }

  .yes-btn:hover {
    background: darkgreen;
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
	.update-btns>button {
		width: 120px;
	}
	.cancel-modal {
		width: 330px;
		padding: 20px;
=======
@media screen and (max-width: 600px) {
	.scroll {
		height: 480px;
		width: 350px;
		margin-left: auto;
		margin-right: auto;
	}
	
	td, th {
		padding: 10px 5px;
		font-size: 15px;
	}
	
	li a {
		padding: 10px 5px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	}
}
</style>
</head>


<body>
<<<<<<< HEAD
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


		<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="currentDate" />

		
		
		<c:forEach items="${userAppointments }" var="a">
			
			<c:choose>
				<c:when test="${a.appointmentDate >= currentDate }">

					<div class="tabs">

						<p>
							Patient Name: <span>${a.patientFirstName }&nbsp;${a.patientLastName }</span>
						</p>
						
						<p>
							Appointment Id: <span>${a.appointmentId }</span>
						</p>
						
						<p>
							Patient Id: <span>${a.patientId }</span>
						</p>
						
						<p>
							Check-up type: <span>${a.checkup }</span>
						</p>
						
						<p>
							Appointment Date: <span>${a.appointmentDate }</span>
						</p>
						
						<p>
							Status: <span id="active">Active</span> 
						</p>
						
						<div>
							<a href="UserEditAppointment?appid=${a.appointmentId}&pid=${a.patientId}" id="edit">Edit</a>
							<a href="UserDeleteAppointment?appid=${a.appointmentId}&pid=${a.patientId}"
							 id="delete"  class="delete-btn" onclick="return confirm('Are you sure want to delete appointment')">Cancel</a>
						</div>

					</div>

				</c:when>

				<c:otherwise>
					<div class="closed">

						<p>
							Patient Name: <span>${a.patientFirstName }&nbsp;${a.patientLastName }</span>
						</p>
						<p>
							Appointment Id: <span>${a.appointmentId }</span>
						</p>
						<p>
							Patient Id: <span>${a.patientId }</span>
						</p>
						<p>
							Check-up type: <span>${a.checkup }</span>
						</p>
						<p>
							Appointment Date: <span>${a.appointmentDate }</span>
						</p>

						<p>
							Status: <span>Closed</span>
						</p>
					</div>

				</c:otherwise>

			</c:choose>




		</c:forEach>
		
	</div>
	
	
	
	
	<div class="overlay-2"></div>

=======
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=id%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userappointment.jsp">Book Appointment</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="header">
		<p>Appointment History</p>
	</div>


	<div class="scroll">
		<%

		%>



		<!-- <table> <tr class="heading"><th>Appointment ID</th><th>Patient ID</th><th>Patient Name</th>
			<th>Check-up Type</th><th>Appointment Date</th></tr>-->
		<%
		if (userId == 0) {

			out.println("<h1>You haven't booked any Appointments</h1");
		} else {
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Appointment ID</th>");
			out.println("<th>Patient ID</th>");
			out.println("<th>First Name</th>");
			out.println("<th>Last Name</th>");
			out.println("<th>checkup type</th>");
			out.println("<th>Appointment Date</th>");
			out.println("</tr>");
			while (rs2.next()) {
				out.println("<tr>");
				out.println("<td>" + rs2.getInt("appointment_id") + "</td>");
				out.println("<td>" + rs2.getInt("patient_id") + "</td>");
				out.println("<td>" + rs2.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs2.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs2.getString("checkup_type") + "</td>");
				out.println("<td>" + rs2.getDate("appointment_date") + "</td>");
				out.println("</tr>");

			}
			out.println("</table>");
		}
		%>

	</div>

>>>>>>> e06896c5d3b881a587992830e685134132707732
	<div class="back">
		<p>
			<a href="usermodule.jsp">Go Back</a>
		</p>
	</div>
<<<<<<< HEAD
	
	
	

	
	
	
	

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
     document.querySelector(".cancel-modal").style.display="none";
 });
 


</script>
=======


>>>>>>> e06896c5d3b881a587992830e685134132707732
</body>
</html>