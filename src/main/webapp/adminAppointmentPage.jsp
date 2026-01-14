<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments Page | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<<<<<<< HEAD
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Poppins', sans-serif;
	/*background-image: linear-gradient(to right, #eacda3 , #d6ae7b);*/
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
        background-color: rgb(89, 88, 88, 0.5);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        backdrop-filter: blur(5px);
        z-index: 5;
      }

      .header {
      	top: 0;
      	position: sticky;
      	background: white;
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



=======

<style type="text/css">
body {
	margin: 0;
	background-color: white;
	font-family: 'Poppins', sans-serif;
}

* {
	box-sizing: border-box;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1px solid gray;
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
	font-weight: 700;
	transition-duration: 0.4s;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: white;
	border-radius: 8px;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-weight: 500;
}

.dropdown-content a:hover {
	background-color: lavendar;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	display: inline-flex;
	height: 36.6px;
	padding: 0;
	background: transparent;
	border: none;
	outline: none;
	overflow: hidden;
	font-size: 16px;
	font-weight: 300;
}

.dropbtn span:hover, .dropbtn span {
	background-color: lavendar;
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
	padding: 20px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.2em;
}



.nav {
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid grey;
}

.nav .login-container {
	float: right;
}

.nav p {
	margin-top: 0;
	float: left;
	display: inline-block;
	color: black;
	text-align: center;
	padding: 0px 14px;
	text-decoration: none;
	font-size: 15px;
	font-weight: 1000;
	padding-top: 13px;
}

input:focus {
	box-shadow: 0px 0px 5px 1px #317AC7;
	border: none;
}

input:hover {
	box-shadow: 0px 0px 8px 1px #317AC7;
	border: none;
}

input {
	border: none;
	width: 50%;
	padding: 10px 5px;
	margin: 8px 0;
	margin-bottom: 15px;
	display: block;
	box-shadow: 0px 0px 0px 1px #317AC7;
	border-radius: 5px;
	box-sizing: border-box;
	outline: none;
	background-color: transparent;
	margin-right: auto;
	margin-left: auto;
	font-size: 15px;
	width: 120px;
	transition: .34s ease;
}

select option {
	background: white;
	color: black;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
}

input::placeholder {
	font-weight: bold;
	opacity: 0.6;
	font-size: 12px;
}

button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid transparent;
	padding: 10px 5px;
	width: 80px;
	border-radius: 5px;
	background-color: #9cb2ce;
	cursor: pointer;
	font-weight: bold;
	transition: 0.35s ease;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

.list form {
	margin-left: auto;
	margin-right: auto;
	border: 0px solid transparent;
	padding: 10px 5px 12px 5px;
	margin-top: 3%;
	width: 500px;
	border-radius: 10px;
	box-shadow: 0px 0px 5px 2px grey;
	transition: .34s ease;
}

.list form:hover {
	box-shadow: 0px 0px 5px 2px blue;
}

.list p {
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732

#back {
	color: black;
	border: none;
	background-color: transparent;
	font-size: 17px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5%;
	font-weight: bolder;
	cursor: pointer;
	text-decoration: none;
	transition: 0.34s ease;
}

#back:hover {
	text-decoration: underline;
}


<<<<<<< HEAD
 .container {
 	
 	max-width: 300px;
 	border-radius: 5px;
 	padding: 10px;
 	margin: 20px auto;
 	display: flex;
 	flex-direction: column;
 	gap: 20px;
 }

 .container > .app-box {
 	border-radius: 5px;
 	padding: 20px;
 	box-shadow: 0 0 3px 1px gainsboro;
 	transition: .4s;
 }
 
 .container > .app-box:hover {
 	transform: translateY(-5px);
 }
 
 .container > .app-box > form {
 	display: flex;
 	flex-direction: column;
 	gap: 10px;
 }
 
 select, input {
 	padding: 10px;
 	border: 1px solid grey;
 	border-radius: 5px;
 	transition: .4s;
 	outline: none;
 }

select:focus, input:focus {
	border: 1px solid dodgerblue;
}

.container > .app-box > form > button {
	padding: 10px;
	border: none;
	color: white;
	outline: none;
	cursor: pointer;
	background: tomato;
	transition: .4s;
	border-radius: 5px;
}

.container > .app-box > form > button:hover {
	background: dodgerblue;
=======
 

@media screen and (max-width:600px) {

	.list form {
		width: 320px;
	
	}
	
	li a {
		padding: 10px 5px;
	}
	
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

</style>
</head>
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
            <li><a href="adminmodule.jsp">HOME</a></li>
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

        <p>${adminName}</p>
      </div>

      <hr id="menu-bar-hr" />

      <div class="sub-menu-2">
          <ul>
          <li>
            <div id="account-settings" class="dropdownbtn">
              <a href="#" class="dropdownbtn">Account Settings</a>
              <i class="fa fa-angle-right"> </i>
            </div>

            <ul class="sub-menu">
              <li><a href="AdminViewProfileServlet">View Profile</a></li>

              <li><a href="AdminProfileDetails">Update Profile</a></li>
              <li><a href="adminChangePassword.jsp">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutAdminServlet">Logout</a></li>
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
        <p>${adminName }</p>
      </div>
      <hr id="side-bar-hr" />
      <div class="side-bar-links">
        <ul>
          <li>
            <a href="adminmodule.jsp">Home</a>
          </li>
          <li>
            <div id="side-bar-account-settings" class="side-bar-dropdown-btn">
              <a href="#" class="side-bar-dropdown-btn">Account Settings</a>
              <i class="fa fa-angle-right" id="side-bar-angle-right"> </i>
            </div>

            <ul class="side-bar-sub-menu">
             <li><a href="AdminViewProfileServlet">View Profile</a></li>

              <li><a href="AdminProfileDetails">Update Profile</a></li>
              <li><a href="adminChangePassword.jsp">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutAdminServlet">Logout</a></li>
        </ul>
      </div>
    </div>

    <div class="overlay"></div>

	<div class="container">
        <div class="app-box">
            <form action="AdminViewAppointmentsOnDateServlet" method="post">
                <p>Search Appointment</p>
                <input type="date" name="appdate" required>
                <button type="submit">Search</button>
            </form>
        </div>
		
		<div class="app-box">
			<form method="post" action="AdminAppointmentServlet">
			<p>Appointments By Department</p>
				<select required name="doctorview">
					<option value="" disabled="disabled" selected="selected">Search specific appointments</option>
					 
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
				<button type="submit">view</button>
			</form>
		</div>
		
        <div class="app-box">
            <form action="AdminAppointmentServlet">
                <p>All Appointments</p>
                <button type="submit">View</button>
            </form>
        </div>

        <div class="app-box">
            <form action="AdminCurrentAppointments">
                <p>Today Appointments</p>
                <button type="submit">View</button>
            </form>
        </div>
    </div>
=======
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("adminName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("adminAccountId")%></a>
					<a href="admindetails.jsp">My Details</a> <a
						href="/HMS/AdminDisplayAllDoctors">Doctors list</a> <a
						href="adminViewPatients.jsp">Patient List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="list">
		<div class="app1">

			<form action="adminViewAppointmentOnDate.jsp" method="post"
				style="margin-top: 4%;">

				<p>Search Appointment</p>
				<input type="date" name="appdate" value="yyyy/mm/dd"
					required="required">
				<button type="submit">Search</button>
			</form>
		</div>

		<div class="app2">

			<form action="adminAppointmentDetails.jsp" method="post">
				<p>All Appointments</p>
				<button type="submit">View</button>
			</form>
		</div>

		<div class="app3">

			<form action="adminCurrentAppointments.jsp">
				<p>Today Appointments</p>
				<button type="submit">View</button>
			</form>
		</div>
	</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732


	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>

<<<<<<< HEAD
	<script type="text/javascript" src="JS/script.js"></script>
=======

>>>>>>> e06896c5d3b881a587992830e685134132707732
</body>
</html>