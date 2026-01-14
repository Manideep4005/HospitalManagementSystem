<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 
 
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@include file="adminSessionValidate.jsp" %> 
    <% 
    	Integer userId = (Integer)session.getAttribute("adminAccountId");
    	String adminName = (String)session.getAttribute("adminName");
    	
    	Statement stmt = MySqlConnection.getConnection().createStatement();
    	ResultSet rs = stmt.executeQuery("select * from admin");
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
<title>Hospital Management System</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

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

 

.scroll {

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
		
		<c:forEach items="${alist }" var="a">
		
			<div class="user-tabs">
			
				<p>${a.admin_id }</p>
				<h3>${a.firstName }&nbsp;${a.lastName }</h3>
				<p>${a.gender }</p>
				
				 
				<h4>Contact Information</h4>
				<p>${a.email }</p>
				<p>${a.contact }</p>
				<p>${a.address }</p>
				
				
			
			</div>
		
		</c:forEach>
	</div>


	<div class="back">
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
	
	<script type="text/javascript" src="JS/script.js"></script>

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
		margin-left:10px;
	}
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
	color:black;
}
</style>
</head>
<body>
    <div class="topnav">
  <ul>
    <li><a href="adminmodule.jsp">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=adminName %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=userId %></a>
        <a href="admindetails.jsp">My Account</a>
        <a href="/HMS/AdminDisplayAllDoctors">Doctors List</a>
        <a href="LogoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="scroll">
    <table>
        <tr>
            <th>Admin Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Contact</th>
            
        </tr>

        
        
        <%
          while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("admin_id") + "</td>");
            out.println("<td>" + rs.getString("admin_firstname") + "</td>");
            out.println("<td>" + rs.getString("admin_lastname") + "</td>");
            out.println("<td>" + rs.getString("password") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td>" + rs.getString("gender") + "</td>");
            out.println("<td>" + rs.getString("address") + "</td>");
            out.println("<td>" + rs.getLong("contact") + "</td>");
            out.println("</tr>");
          }
        %>
    </table>
</div>
<div class="get_details">
        <form method="post" action="adminmodule.jsp">
            <button type="submit">Go Back</button>
        </form>
    </div>
</body>
</html>
