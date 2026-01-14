<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp" %> 
<<<<<<< HEAD
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
<%
Integer userId = (Integer) session.getAttribute("adminAccountId");
String adminName = (String) session.getAttribute("adminName");

Statement stmt = MySqlConnection.getConnection().createStatement();
ResultSet rs = stmt.executeQuery("select * from patient");
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Patients List | Hospital Management System</title>
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
	display: flex;
	justify-content: space-between;
}

.container > .tabs > .data {
	max-width: 400px;
}

.container > .tabs > .btns {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container > .tabs > .btns > button {
	color: white;
	background: tomato;
	border-radius: 5px;
	padding: 10px;
	cursor: pointer;
	transition: .4s ease;
	border: 1px solid transparent;
}


.container > .tabs > .btns > button:hover {
	transform: scale(1.05);
	background: red;
}

.container > .tabs > .data > p {
	margin: 2px 0;
}

.back {
	width: 100px;
	margin: 10px auto;
	
}

.back > button {
	border: 1px solid transparent;
	ouline: none;
	color: white;
	background: grey;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: .4s;
	
}

.back > button:hover {
	transform: scale(1.02);
}

.no_patient_data {
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	text-align: center;
	color: green;
}

=======

<style type="text/css">
* {
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
	overflow: auto;
	background-color: white;
	border-bottom: 1px solid #a8a8a8;
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
	font-weight: 300;
	transition: 0.1s ease;
	border-radius: 5px;
	font-weight: 1000;
}

li a:hover, .dropdown:hover {
	background-color: #d3d3d3;
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
	border-radius: 8px;
	margin-left: -90px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
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
	background-color: #778899;
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

.dropbtn span:hover, .dropbtn span {
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
	padding: 1px 5px;
	color: white;
	height: 100%;
	font-weight: 1000;
}

.button-icon {
	font-size: 1.5em;
}

.scroll {
	margin-top: 1%;
	overflow-y: auto;
	height: 500px;
	padding: 5px;
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
	top: -5px;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 10px;
	font-size: 16px;
	border: 1px solid #ccc;
}

h1 {
	text-align: center;
	color: #60FD00;
}

@media screen and (max-width:600px) {
	.scroll {
		height: 450px;
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
	input {
		margin-left: 10px;
		padding: 10px 5px;
	}
}


.nav {
	padding: 10px;
}

.nav .form {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

input {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 2px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

input:focus {
	box-shadow: 0 0 0 2px dodgerblue;
	border-color: transparent;
}

.nav button {
	border: none;
	display: inline-block;
	margin: 0;
	padding: 10px 15px;
	border-radius: 3px;
	width: 30%;
	border: 2px solid dodgerblue;
	background-color: white;
	font-size: 15px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.nav button:hover {
	border-color: transparent;
	background-color: #008cba;
	color: white;
}

#demo {
	color: red;
	text-align: center;
	margin: 0;
}

.back button {
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

.back button:hover {
	text-decoration: underline;
}

#userId {
	color: dodgerblue;
	text-decoration: none;
}
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
	 	
	 		
	 	<c:choose>	
	 		<c:when test="${patientCount == 0}">
	 		
	 			<div class="no_patient_data">Patients data not found</div>
	 			
	 		</c:when>
	 		
	 		
	 		<c:otherwise>
	 		<c:forEach items="${plist}" var="p">
	 		<div class="tabs">
	 	
	 			<div class="data">
	 				<p>${p.patientId }</p>
	 			<p>${p.patientLastName}&nbsp;${p.patientFirstName }<p>
	 			<p>${p.gender }<p>
	 			<p>${p.age }<p>
	 			<p>${p.checkup }<p>
	 			<p>${p.symptoms }<p>
	 			<p>${p.email }<p>
	 			<p>${p.address }<p>
	 			<p>${p.contact }<p>
	 			<p>${p.admittedDate }</p>
	 			<p>${p.userId }</p>	
	 			</div>
	 			<div class="btns">
	 				
	 				<button onclick="navigate('AdminDeletePatientServlet?patientid=${p.patientId}', '${p.patientFirstName}', '${p.patientLastName}')">Delete Patient</button>
	 				
	 			</div>
	 	
	 		</div>
	 		</c:forEach>
	 		</c:otherwise>
	 	</c:choose>
	 	
	 </div>
	 

	 
	<div class="back">
		
			<button onclick="back('adminmodule.jsp')">Go Back</button>
		
=======
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=adminName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="adminAppointmentDetails.jsp">Appointment
						Details</a> <a href="adminPatientsDepartmentView.jsp">Patient
						Department wise</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>
	
	<!--  <div class="patient_view">
	<table>
		<tr>
			<th>Patient Id</th>
			<th>Patient Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Check-up</th>
			<th>Symptoms</th>
			<th>Email</th>
			<th>Address</th>
			<th>Contact</th>
			<th>Appointment date</th>
			<th>User Id</th>
			
		</tr>
		
/*while (rs.next()) {
	out.println("<tr>");
	out.println("<td>" + rs.getInt("patient_id") + "</td>");
	out.println("<td>" + rs.getString("patient_name") + "</td>");
	out.println("<td>" + rs.getString("gender") + "</td>");
	out.println("<td>" + rs.getInt("age") + "</td>");
	out.println("<td>" + rs.getString("checkup_type") + "</td>");
	out.println("<td>" + rs.getString("symptoms") + "</td>");
	out.println("<td>" + rs.getString("email") + "</td>");
	out.println("<td>" + rs.getString("address") + "</td>");
	out.println("<td>" + rs.getLong("contact") + "</td>");
	out.println("<td>" + rs.getTimestamp("admitted_date") + "</td>");
	out.println("<td>" + rs.getInt("user_id") + "</td>");
	out.println("</tr>");
}*/
		%>
	</table>
</div>-->

	<div class="scroll">
		<table>
			<tr>
				<th>Patient Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Check-up</th>
				<th>Symptoms</th>
				<th>Email</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Appointment date</th>
				<th>User Id</th>

			</tr>

			<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td><a id=\"userId\" href=\"adminViewPatientDetails.jsp?id=" + rs.getInt("patient_id") + "\">"
						+ rs.getInt("patient_id") + "</a></td>");
				out.println("<td>" + rs.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs.getString("gender") + "</td>");
				out.println("<td>" + rs.getInt("age") + "</td>");
				out.println("<td>" + rs.getString("checkup_type") + "</td>");
				out.println("<td>" + rs.getString("symptoms") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("address") + "</td>");
				out.println("<td>" + rs.getLong("contact") + "</td>");
				out.println("<td>" + rs.getTimestamp("admitted_date") + "</td>");
				out.println("<td>" + rs.getInt("user_id") + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
	</div>

	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>
	
	
	
	
	<script type="text/javascript">
		function validateForm() {

			var y = document.getElementById("one").value;

			if (isNaN(y)) {
				document.getElementById("demo").innerHTML = "Enter Numbers Only.";
				return false;
			} else if (y.length == "" || y.length < 5) {
				document.getElementById("demo").innerHTML = "Please Enter 5 Digit Id";
				return false;
			} else {
				return true;
			}

		}
<<<<<<< HEAD
		
		
		function navigate(url, patientFirstName, patientLastName) {
			 if (confirm('Are you sure you want to delete ' + patientFirstName + ' ' + patientLastName+ '?')) {
			        window.location.href = url;
			    }
			    return false; 
		}
		
		function back(url) {
			        window.location.href = url;
		}
	</script>
	<script type="text/javascript" src="JS/script.js"></script>
</body>
</html>

=======
	</script>
	
</body>
</html>
>>>>>>> e06896c5d3b881a587992830e685134132707732
