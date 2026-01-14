<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<<<<<<< HEAD
 
=======
<%
String userId = (String) session.getAttribute("userSessionId");
%>

<%
// JDBC CODE TO GET USER NAME
PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select first_name,last_name,userid,email from user where userid = ?");
pstmt.setString(1, userId);

Integer uId = 0;
String userFirstName = "";
String userLastName = "";
String userEmail = "";

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	uId = rs.getInt("userid");
	userFirstName = rs.getString("first_name");
	userLastName = rs.getString("last_name");
	userEmail = rs.getString("email");
}

String userName = userFirstName + " " + userLastName;

session.setAttribute("userLogoutName", userFirstName + " " + userLastName);
session.setAttribute("currentUserName", userFirstName + " " + userLastName);
session.setAttribute("userAccountId", new Integer(uId));
session.setAttribute("userEmail", userEmail);
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mani Hospitals | A way to Better Life</title>
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
	box-sizing: border-box;
<<<<<<< HEAD
	margin: 0;
	padding: 0;
}

body {
	font-family: "Poppins", sans-serif;
	background-color: white;
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
      

.container {
	margin: 30px auto;
	max-width: 400px;
	display: flex;
	flex-direction: column;
	align-items: center;
	
}
      
      
.cards {
margin: 10px 0;
	 width: 320px;
	box-shadow: 0 0 0 1px gainsboro;
	display: flex;
	align-items: center;
	flex-direction: column;
	gap: 12px;
	padding: 10px;
	border-radius: 5px;
}

.cards > p {
	font-size: 17px;
}

.cards > form > button {
	font-size: 17px;
	border-radius: 5px;
	background: grey;
	color: white;
	width: 100%;
	border: none;
	padding: 10px;
	cursor: pointer;
	display: block;
	transition: .4s;
}

.cards > form > button:hover {
	background: #a8a8a8;
=======
	font-family: "Poppins", sans-serif;
}

body {
	margin: 0;
	background-color: white;
}

.topnav {
	background-color: white;
	color: black;
	text-align: center;
	height: auto;
	margin: 0px;
	box-shadow: 0 0 5px black;
}

.topnav p {
	padding: 10px 0px;
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	color: black;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 5px;
	overflow: hidden;

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
	font-weight: 600;
	transition: 0.1s ease;
	transition: 0.4s ease;
}

li a:hover, .dropdown:hover {
	background-color: #a8a8a8;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	margin-left: -2px;
	box-shadow: 0px 8px 16px 0px #09203F;
	z-index: 1;
	border-radius: 1px;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: bold;
	transition: 0.1s;
	font-size: 14px;
}

.dropdown-content a:hover {
	background-color: #a8a8a8;
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

.dropbtn span:hover, .dropbtn span {
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
	padding: 20px 5px;
	height: 100%;
}

.button-text {
	font-weight: 1000;
}

.button-icon {
	font-size: 1.3em;
}

.column {
	float: left;
	/*      width: 33.33%;*/
	padding: 0px 15px 0px 15px;
	border: 1px solid red;
}

.column.side {
	width: 25%;
}

.column.middle {
	width: 50%;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.intro {
	padding: 10px;
	margin-top: 1%;
	padding-left: 15px;
	margin-left: 1%;
	margin-right: 1%;
	border-radius: 2%;
	box-shadow: 0px 0px 5px 0px #537895;
}

.intro p {
	color: black;
	font-weight: 500;
	font-size: 20px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

select:focus {
	border: 2px solid #317AC7;
	box-shadow: none;
}

select {
<<<<<<< HEAD
	width: 100%;
	padding: 10px;
	display: block;
	margin: 12px 0;
	border: 2px solid transparent;
	box-shadow: 0px 0px 0px 1px midnightblue;
=======
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border: 2px solid transparent;
	box-shadow: 0px 0px 5px 0px midnightblue;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	border-radius: 5px;
	box-sizing: border-box;
	outline: none;
	background-color: transparent;
	transition: 0.34s ease;
	margin-left: auto;
	margin-right: auto;
<<<<<<< HEAD
	cursor: pointer;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

select option {
	background: white;
	color: black;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
}

<<<<<<< HEAD
 @media screen and (max-width: 600px) {
	
	
	
}




</style>
</head>
<body>
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
        <ul><li>Active Appointments (${activeUserAppointments })</li>
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
        <ul>
        <li>Active Appointments (${activeUserAppointments })</li>
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
	 


	<div class="container">
		<div class="cards">
			<p>Find a Doctor</p>
			<form method="post" action="UserViewDoctorServlet">
				<select required name="doctorview">
					<option value="all">All</option>
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
				</select> <button type="submit">view</button> 

			</form>
		</div>

		<div class="cards">
			<p>Book Appointment</p>
			<form action="userappointment.jsp" method="post">
				<button type="submit">book</button>
			</form>
		</div>
		
		<!--  <div class="cards">
			<p>Book Lab Tests</p>
			<form action="#" method="post">
				<button type="submit">book</button>
			</form>
		</div>
	</div>-->

 <script>
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
    </script>
=======
.doctor_view, .book {
	box-shadow: 0px 0px 5px 0px #09203F;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
	padding: 15px 20px;
	border-radius: 2%;
	width: 500px;
	text-align: center;
	transition: 0.34s ease;
	background-image: none;
}

.doctor_view form, .book form {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}

.book {
	padding: 25px;
}

.doctor_view:hover, .book:hover {
	box-shadow: 0px 0px 5px 2px #09203F;
}

.doctor_view p {
	font-size: 20px;
	font-weight: 600;
}

.book p {
	font-size: 20px;
	font-weight: 600;
	text-align: center;
}

.book button {
	border: none;
	background-color: #a8a8a8;
	color: black;
	padding: 10px 15px;
	border-radius: 2px;
	width: 50%;
	cursor: pointer;
	transition: 0.34s ease;
	font-size: 16px;
	font-weight: 600;
}

.book button:hover {
	background-color: #537895;
	color: white;
	transform: scale(1.25);
}

.doctor_view button {
	border: none;
	background-color: #a8a8a8;
	color: black;
	padding: 10px 15px;
	border-radius: 2px;
	width: 50%;
	cursor: pointer;
	transition: 0.34s ease;
	display: block;
	margin-left: auto;
	margin-right: auto;
	font-size: 16px;
	font-weight: 600;
}

.doctor_view button:hover {
	background-color: #537895;
	color: white;
	transform: scale(1.25);
}

@media screen and (max-width: 600px) {
	.book, .doctor_view {
		width: 320px;
	}
	.book form, .doctor_view form {
		width: 300px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		min-width: 160px;
		margin-left: -15px;
	}
	
	.topnav p {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="header"></div>

	<div class="topnav">
		<p>Welcome To Hospital Management System</p>
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userAppointmentHistory.jsp">Appointment
						History</a> <a href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="doctor_view">
		<p>Find A Doctor</p>
		<form method="post" action="UserViewDoctorServlet">
			<select required name="doctorview">
				<option value="all">All</option>
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
			</select> &nbsp;&nbsp;&nbsp;<span><button type="submit">View</button></span>

		</form>
	</div>

	<div class="book">
		<p>Consult A Doctor</p>
		<form action="userappointment.jsp" method="post">
			<button type="submit">Book</button>
		</form>
	</div>

>>>>>>> e06896c5d3b881a587992830e685134132707732
</body>
</html>