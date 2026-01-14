<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    <%@include file="adminSessionValidate.jsp" %> 
<<<<<<< HEAD
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
=======
    <%
    	
    	Integer id = Integer.parseInt(request.getParameter("patientid"));
    	//Long number = Long.parseLong(request.getParameter("mobilenumber"));
    	
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where patient_id = ?");
    	pstmt.setInt(1, id);
    	//pstmt.setLong(2, number);
    	
    	boolean status;
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	status  = rs.next();
    	
    	ResultSet rs1 = pstmt.executeQuery();
    	
    %>
>>>>>>> e06896c5d3b881a587992830e685134132707732
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>Patient Details | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
}

 
 
.container > .tabs > p > span {
	font-weight: 600;
=======
<title>Patient Details | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />


<style type="text/css">
    
    * {
        box-sizing: border-box;
		font-family: 'Poppins', sans-serif;
    }
    
    body {
        margin: 0;
    
    }
    
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: transparent;
    border-bottom: 1px solid gainsboro;
}

li {
  float: left;
  
}

li a{
  display: inline-block;
  color: black;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-weight: 700;
  transition: 0.34s  ;
  border-radius: 5px;
}

li a:hover, .dropdown:hover  {
  background-color: #F6D7AF;
  color: black;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
}
 
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #F6D7AF;
  min-width: 160px;
  margin-left: -40px;
  
  box-shadow: 0px 8px 16px 0px #d28d3d;
  border-radius: 10px;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
  font-weight: 300;
  font-weight: bold;
  transition: 0.34s  ;
}

.dropdown-content a:hover {background-color: #eba46e;}

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

.dropbtn span:hover, .dropbtn span{
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


table {
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
	padding: 15px 10px;
	box-shadow: 0px 0px 10px 1px #F6D7AF;
	border-radius: 1%;
	transition: 0.34s ease;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

 

<<<<<<< HEAD
.container > .tabs   > p {
	margin: 2px 0;
}

.back {
	margin: 10px auto;
	width: 100px;
}

.back > form > button {
	border: none;
	background: skyblue;
	color: white;
	font-size: 14px;
	cursor: pointer;
	transition: .4s;
	width: 100%;
	padding: 10px;
	border-radius: 5px;
}

.back > form > button:hover {
	background: dodgerblue;
}


.no_patient_date {
	font-size: 18px;
}

=======
th {
	padding: 5px 10px;
	font-size: 15px;
	text-align: left;
}

td {
	padding: 5px 10px;
	font-size: 15px;
	color: black;
}

h1 {
	text-align: center;
	font-family: cursive;
}

form button {
	display: block;
	margin-top: 2.5%;
	margin-left: auto;
	margin-right: auto;
	border: none;
	padding: 10px 15px;
	border-radius: 3px;
	font-size: 16px;
	background-color: #168AAD;
	color: white;
	transition-duration: .4s;
	cursor: pointer;
}

form button:hover {
	background-color: #eba46e;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
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
 		
 		<c:when test="${getpatient.size() == 0}">
 			<div class="no_patient_date">Patient Data not Found</div>
 		</c:when>
 	
 	
 		<c:otherwise>
 
 	<c:forEach items="${getPatient}" var="p">
	 		<div class="tabs">
	 	
	 			 
	 			<p> <span>Id: </span>${p.patientId }</p>
	 			<p><span>Name: </span>${p.patientLastName}&nbsp;${p.patientFirstName }<p>
	 			<p><span>Gender: </span>${p.gender }<p>
	 			<p><span>Age: </span>${p.age }<p>
	 			<p><span>Check-up: </span>${p.checkup }<p>
	 			<p><span>Symptoms: </span>${p.symptoms }<p>
	 			<p><span>Email: </span>${p.email }<p>
	 			<p><span>Address: </span>${p.address }<p>
	 			<p><span>Contact: </span>${p.contact }<p>
	 			<p><span>Joined Date: </span>${p.admittedDate }</p>
	 			<p><span>User Id: </span>${p.userId }</p>	
	 		 
	 			 
	 		</div>
	 		</c:forEach>
	 		
	 		</c:otherwise>
	 		</c:choose>
     </div>
     
     
=======
    <div class="topnav">
  <ul>
    <li><a href="adminmodule.jsp">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=session.getAttribute("adminName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("adminAccountId") %></a>
        <a href="admindetails.jsp">My Account</a>
        <a href="adminViewPatients.jsp">Patients List</a>
        <a href="LogoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>



<!-- <div class="nav">
        <p>Search Patients</p>
        <div class="login-container">
            <form method="post" action="adminSearchPatientDetails.jsp">
                <input type="text" name="mobilenumber" required maxlength="5" placeholder="Contct...">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div> -->

    <div class="view">
        
            <%
            
            	if (status == false) {
            		out.println("<h1>No data found</h1>");
            		
            	}
            	else {
            		while (rs1.next()) {
            			out.println("<h1>Data found below</h1>");
            			out.println("<table>");
            			out.println("<tr>");
            			out.println("<th>Patient Id</th>");
            			out.println("<td>" + rs1.getInt("patient_id")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>First Name</th>");
            			out.println("<td>" + rs1.getString("patient_firstname")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Last Name</th>");
            			out.println("<td>" + rs1.getString("patient_lastname")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Gender</th>");
            			out.println("<td>" + rs1.getString("gender")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Age</th>");
            			out.println("<td>" + rs1.getInt("age")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Check-up</th>");
            			out.println("<td>" + rs1.getString("checkup_type")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Symptoms</th>");
            			out.println("<td>" + rs1.getString("symptoms")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Email</th>");
            			out.println("<td>" + rs1.getString("email")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Address</th>");
            			out.println("<td>" + rs1.getString("address")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Contact</th>");
            			out.println("<td>" + rs1.getLong("contact")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>Join Date</th>");
            			out.println("<td>" + rs1.getTimestamp("admitted_date")+ "</td>");
            			out.println("</tr>");
            			out.println("<tr>");
            			out.println("<th>User Id</th>");
            			out.println("<td>" + rs1.getInt("user_id")+ "</td>");
            			out.println("</tr>");
            			out.println("</table>");
            		}
            	}
            %>
    </div>
    
>>>>>>> e06896c5d3b881a587992830e685134132707732
	<div class="back">
		<form method="post" action="adminGetPatient.jsp">
			<button type="submit">Go back</button>
		</form>
	</div>
<<<<<<< HEAD
	
		<script type="text/javascript" src="JS/script.js"></script>
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
</body>
</html>