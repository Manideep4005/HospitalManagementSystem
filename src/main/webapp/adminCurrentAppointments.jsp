<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.CurrentDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<<<<<<< HEAD
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
=======

<%
Date date = CurrentDate.getCurrnetDate();

PreparedStatement stmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where appointment_date=?");
stmt.setDate(1, date);
ResultSet rs1 = stmt.executeQuery();

int count = 0;

while (rs1.next()) {
	count++;
}

ResultSet rs = stmt.executeQuery();

SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
String currentDate = formatter.format(date);
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Today Appointments Details | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
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



.current form { 
=======
<style type="text/css">
body {
	margin: 0;
	backround-color: white;
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
	box-shadow: 0px 1px 0px 0px grey;
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
	transition: 0.4s;
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
	display: none;
	position: absolute;
	min-width: 160px;
	text-align: center;
	margin-left: -50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 8px;
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
	font-size: 16px;
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
	font-size: 16px;
	border: 1px solid #ccc;
}



@media screen and (max-width:600px) {
	.scroll {
		height: 450px;
		padding: 5px;
	}
	td, th {
		font-size: 14px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
 
}

h1 {
	text-align: center;
}

.current form {
>>>>>>> e06896c5d3b881a587992830e685134132707732
	margin-top: 1%;
}

.current button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid transparent;
	padding: 10px 5px;
	width: 150px;
	border-radius: 5px;
	background-color: transparent;
	cursor: pointer;
	font-weight: bold;
	transition: 0.35s ease;
	text-decoration: underline;
	font-size: 17px;
}

.current button:hover {
	border-color: orange;
	text-decoration: none;
}
<<<<<<< HEAD


.container {
	max-width: 500px;
	margin: 20px auto;
	display: flex;
	gap: 10px;
	flex-direction: column;
}

.container > .tabs {
	box-shadow: 0 0 1px 0px grey;
	border-radius: 5px;
	padding: 20px;
	font-size: 14px;
}

 
 
.container > .tabs > p > span {
	font-weight: 600;
}

 

.container > .tabs   > p {
	margin: 2px 0;
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
 
 
 	<c:choose>
 		
 		<c:when test="${appointments.size() == 0}">
 			<div class="no_patient_date">Appointments not Found</div>
 		</c:when>
 	
 	
 		<c:otherwise>
 
 	<c:forEach items="${appointments}" var="a">
	 		<div class="tabs">
	 	
	 			 
	 			<p> <span>Appointment Id: </span>${a.appointmentId }</p>
	 			<p><span>Patient Id: </span>${a.patientId }</p>
	 			<p><span>Name: </span>${a.patientLastName}&nbsp;${a.patientFirstName }<p>
	 			<p><span>Gender: </span>${a.gender }<p>
	 			<p><span>Age: </span>${a.age }<p>
	 			<p><span>Check-up: </span>${a.checkup }<p>
	 			<p><span>Symptoms: </span>${a.symptoms }<p>
	 			<p><span>Email: </span>${a.email }<p>
	 			<p><span>Address: </span>${a.address }<p>
	 			<p><span>Contact: </span>${a.contact }<p>
	 			<p><span>Appointment Date: </span>${a.appointmentDate }</p>
	 		 
	 			 
	 		</div>
	 		</c:forEach>
	 		
	 		</c:otherwise>
	 		</c:choose>
     </div>
=======
</style>
</head>
<body>
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

	<!--   <div class="nav">
        <p>Enter Patient Id For Complete Details</p>
        <div class="login-container">
            <form method="post" action="adminViewPatientDetails.jsp">
                <input type="text" name="patientId" required maxlength="5" placeholder="Enter patient id">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>-->

	<div class="scroll">
		<table>
			<!--   <tr>
                <th>Appointment Id</th>
                <th>Patient Id</th>
                <th>Patient Name</th>
                <th>Check-up</th>
                <th>Appointment Date</th>
                <th>User Id</th>
            </tr>-->

			<%
			if (count == 0) {
				out.println("<H1>No Appointments Today - " + currentDate + "</h1>");
			} else {
				out.println("<tr>");
				out.println("<th>Appointment Id</th>");
				out.println("<th>Patient Id</th>");
				out.println("<th>Patient First Name</th>");
				out.println("<th>Patient Last Name</th>");
				out.println(" <th>Check-up</th>");
				out.println(" <th>Appointment Date</th>");
				out.println("<th>User Id</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("appointment_id") + "</td>");
					out.println("<td>" + rs.getInt("patient_id") + "</td>");
					out.println("<td>" + rs.getString("patient_firstname") + "</td>");
					out.println("<td>" + rs.getString("patient_lastname") + "</td>");
					out.println("<td>" + rs.getString("checkup_type") + "</td>");
					out.println("<td>" + rs.getDate("appointment_date") + "</td>");
					out.println("<td>" + rs.getInt("user_id") + "</td>");
					out.println("</tr>");
				}

			}
			%>

		</table>
	</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732

	<div class="current">
		<form action="adminAppointmentPage.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
	</div>
<<<<<<< HEAD
	
	
		<script type="text/javascript" src="JS/script.js"></script>
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
</body>
</html>