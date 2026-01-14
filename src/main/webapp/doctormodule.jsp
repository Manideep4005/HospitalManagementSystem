<%@page import="com.hms.doctor.DoctorsBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.admin.DoctorsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

<%@include file="doctorSessionValidate.jsp"%>


 
<%


String doctorFirstName = "";
String doctorLastName = "";
String specialization = "";

Integer doctorId = (Integer)session.getAttribute("doctorSessionId");

DoctorsBean dBean = new DoctorsBean();

ArrayList<DoctorsBean> dlist = dBean.getDoctorById(doctorId);

Iterator<DoctorsBean> itr = dlist.iterator();

while (itr.hasNext()) {
	dBean = itr.next();
	
	doctorFirstName = dBean.getDoctorFirstName();
	doctorLastName = dBean.getDoctorLastName();
	specialization = dBean.getSpecialization();
}


session.setAttribute("doctorLogoutName", doctorFirstName + " " + doctorLastName);
session.setAttribute("doctorAccountName", doctorFirstName + " " + doctorLastName);
session.setAttribute("doctorAccountId", new Integer(doctorId));
session.setAttribute("doctorSpecialization", specialization);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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



.overlay-2 {
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

 
.modal-user-admin {
	display: none;
	background: #f9f9f9;
	padding: 20px;
	height: 200px;
	width: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	border-radius: 5px;
	box-shadow: 0 0 1px gainsboro;
	z-index: 10;
}

.modal-user-admin > .btns {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	gap: 20px;
}

.fa-close {
	cursor: pointer;
	font-size: 20px;
	color: tomato;
}

.modal-user-admin > .btns > div > a {
	display: block;
	background-color: #008cba;
	color: white;
	padding: 10px;
	text-decoration: none;
}

.modal-user-admin > .close {
	display: flex;
	justify-content: flex-end;
}

<title>Welcome | Hospital Management System</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
@charset "ISO-8859-1";

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background-color: white;
}


.topnav p {
	text-align: center;
	margin: 0;
	font-weight: 600;
	font-size: 20px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	box-shadow: 0 2px 5px gray;
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
	transition: 0.5s ease;
	font-weight: bolder;
	font-family: 'Poppins', sans-serif;
}

li a:hover, .dropdown:hover {
	background-color: #778899;
	color: white;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #C9C9BC;
	min-width: 160px;
	margin-left: -21px;
	box-shadow: 0 1px 5px black;
	transition: 0.34s ease;
	border-radius: 1px;
	z-index: 1;
	text-align: left;
}

.dropdown-content:hover {
	
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 600;
	transition: 0.34s ease;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #fffff7;
	color: black;
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
	font-weight: 600;
}

.dropbtn span:hover, .dropbtn span {
	font-weight: bolder;
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
}

.button-icon {
	font-size: 1.5em;
}

.doctor_view {
	width: 300px;
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 0 0 10px #38ef7d;
	border-radius: 10px;
}

.doctor_view p {
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	color: black;
	margin-top: 20%;
	
}

form {
	box-shadow: 0px 0px 10px #A3A398;
	width: 200px;
	height: 200px;
	margin: auto;
	padding: 15px;
	border-radius: 15px;
	transition: 0.34s;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

form:hover {
	box-shadow: 0px 0px 10px 1px #38ef7d;
}

button {
	display: block;
	margin: 8px 0;
	margin-left: auto;
	margin-right: auto;
	border: 2px solid #38ef7d;
	padding: 8px 10px;
	width: 80%;
	cursor: pointer;
	transition: 0.34s;
	border-radius: 5px;
	font-size: 18px;
	background-color: #38ef7d;
	font-weight: 600;
	color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

button:hover {
	background: white;
	border-color: #38ef7d;
	color: #38ef7d;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.button-icon {
		font-size: 1em;
	}
	.button-text, .button-icon {
		padding: 5px;
		height: 100%;
	}
	
	.dropdown-content {
		min-width: 100px;
		margin-left: -10px;
	}
	
	.topnav p {
		display: none;
	}
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

        <p>${doctorAccountName}</p>
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
             <li><a href="doctordetails.jsp">View Profile</a></li>

              <li><a href="#">Update Profile</a></li>
              <li><a href="#">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutDoctorServlet">Logout</a></li>
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
        <p>${doctorAccountName }</p>
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
             <li><a href="doctordetails.jsp">View Profile</a></li>

              <li><a href="#">Update Profile</a></li>
              <li><a href="#">Change Password</a></li>
            </ul>
          </li>
          <li><a href="LogoutDoctorServlet">Logout</a></li>
        </ul>
      </div>
    </div>

    <div class="overlay"></div>
	<div class="topnav">
		
		<ul>
			<p>Hospital Management System</p>
			<li><a href="doctormodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text">Dr. <%=doctorFirstName + " " + doctorLastName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=doctorId%></a> <a href="doctordetails.jsp">My
						Account</a> <a href="LogoutDoctorServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="doctor_view">

		<form action="doctorViewAppointment.jsp" method="post">
			<p>Appointments</p>
			<button type="submit">View</button>
		</form>
	</div>

	<script type="text/javascript" src="JS/script.js"></script>

</body>
</html>
