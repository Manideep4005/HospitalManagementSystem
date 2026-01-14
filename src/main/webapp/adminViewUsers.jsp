<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<<<<<<< HEAD
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 
 
=======
<%
Integer userId = (Integer) session.getAttribute("adminAccountId");
String adminName = (String) session.getAttribute("adminName");

Statement stmt = MySqlConnection.getConnection().createStatement();
ResultSet rs = stmt.executeQuery("select * from user");
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<<<<<<< HEAD
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
font-family: 'Poppins', sans-serif;
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
      	top: 0;
      	position: sticky;
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
	border-bottom: 1px solid gainsboro;
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
	font-weight: 700;
	transition: 0.1s ease;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;;
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
	background-color: #0295A9;
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
	font-size: 1.2em;
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
	border: 1px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
}

input:focus {
	box-shadow: 0 0 0 2px dodgerblue;
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
>>>>>>> e06896c5d3b881a587992830e685134132707732

 

.scroll {
<<<<<<< HEAD

	overflow: auto;
	max-height: 600px;
	max-width: 600px;
	padding: 10px;
	margin: auto;
		margin-top: 1%;
}


.user-tabs {
	display: block;
	max-width: 400px;
	max-height: 80px;
	margin: 12px auto;
	padding:  10px;
	box-shadow: 0 0 1px 1px gainsboro;
	overflow: hidden;
	transition: .4s;
	border-radius: 5px;
}

.user-tabs:hover {
	max-height: 500px;
}

.user-tabs > h4 {
	margin: 10px 0 2px 0;
}
 
#userId {
	display: block;
	color: dodgerblue;
	text-decoration: none;
	font-size: 20px;
	transition-duration: .4s;
}

 

.back { 
	
	max-width: 100px;
	margin:10px auto;
	
}

.back > form > button {
	transition: .4s;
	ouline: none;
	border: none;
	color: white;
	background: #563245;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
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
	 


	<div class="scroll">
		
		<c:forEach items="${ulist }" var="u">
		
			<div class="user-tabs">
			
				<p><a href="adminViewUsersAppointments.jsp?id=${u.userId }" id="userId">${u.userId }</a></p>
				<h3>${u.firstName }&nbsp;${u.lastName }</h3>
				<p>${u.gender }</p>
				
				 
				<h4>Contact Information</h4>
				<p>${u.email }</p>
				<p>${u.contact }</p>
				<p>${u.address }</p>
				
				<h4>Others</h4>
				<p>Account created on : ${u.join_date }</p>
				<p>Password last changed on : ${u.passwordChangeDate }</p>
				<p></p>
			
			</div>
		
		</c:forEach>
	</div>


	<div class="back">
=======
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
	input {
		margin-left: 10px;
		padding: 10px 5px;
	}
}

h1 {
	text-align: center;
}

.get_details button {
	background-color: #168AAD;
	width: 100px;
	color: white;
	padding: 10px 16px;
	margin: 10px 0px;
	border: 2px solid transparent;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	cursor: pointer;
	transition-duration: .4s;
}

.get_details button:hover {
	border: 2px solid #168AAd;
	background-color: white;
	color: black;
}

#userId {
	color: dodgerblue;
	text-decoration: none;
	transition-duration: .4s;
}

#userId:hover {
	transform: scale(1.1);
}
</style>
</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 0px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=adminName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=userId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="/HMS/AdminDisplayAllDoctors">Doctors List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="scroll">
		<table>
			<tr>
				<th>User Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Password</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Joined Date</th>
			</tr>



			<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td><a id=\"userId\" href=\"adminViewUsersAppointments.jsp?id=" + rs.getInt("userid") + "\">"
						+ rs.getInt("userid") + "</a></td>");
				out.println("<td>" + rs.getString("first_name") + "</td>");
				out.println("<td>" + rs.getString("last_name") + "</td>");
				out.println("<td>" + rs.getString("password") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("gender") + "</td>");
				out.println("<td>" + rs.getString("address") + "</td>");
				out.println("<td>" + rs.getLong("contact") + "</td>");
				out.println("<td>" + rs.getDate("join_date") + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
	</div>


	<div class="get_details">
>>>>>>> e06896c5d3b881a587992830e685134132707732
		<form method="post" action="adminmodule.jsp">
			<button type="submit">Go Back</button>
		</form>
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
	</script>
<<<<<<< HEAD
	
	<script type="text/javascript" src="JS/script.js"></script>
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

</body>
</html>