<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
String type = (String) session.getAttribute("specific");

Statement stmt = MySqlConnection.getConnection().createStatement();

int count = 0;

ResultSet rs1 = stmt.executeQuery("select * from doctor");

boolean first = rs1.next();

ResultSet rs2 = stmt.executeQuery("select * from doctor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor's List | HMS</title>
<title>Find Doctor | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	scroll-behavior: smooth;
}

body {
font-family: 'Poppins', sans-serif;
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
        position: sticky;
        top: 0;
        background: white;
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
        position: fixed;
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
 
 
 
.doctor-container {
	margin: 20px auto;
	max-width: 800px;
	max-height: 500px;
	padding: 20px;
	overflow: auto;
	
}

.doctor-container > .doc-tabs {
	margin: 12px auto;
	max-width: 500px;
	padding: 20px;
	box-shadow: 0 0 4px 0px gainsboro;
	border-radius: 5px;
	text-align: center;
	background: #fffff7;
}

.doctor-container > .doc-tabs > p{
	margin: 3px 0;
	font-size: 15px;
}
.doctor-container::-webkit-scrollbar {
  width: 5px;
  height: 5px;
}

/* Track */
.doctor-container::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px gainsboro;
}

/* Handle */
.doctor-container::-webkit-scrollbar-thumb {
  background: dodgerblue;
  cursor: pointer;
<style type="text/css">
body {
	margin: 0;
	background-color: white;
}

* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1px ridge gray;
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
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: #d3d3d3;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: #fff;
	border-radius: 10px;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -10px;
	box-shadow: 0px 8px 16px 0px gainsboro;
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
	background-color: lavendar;
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
	font-weight: 1000;
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
}

.back button {
	margin-top: 2%;
	font-size: 16px;
	border: 2px solid #445454;
	background-color: transparent;
	color: white;
	border-radius: 2px;
	padding: 12px;
	transition-duration: 0.4s;
	cursor: pointer;
	display: block;
	color: #445454;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	font-weight: 600;
}

.back button:hover {
	background-color: #445454;
	color:white;
}	
}

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
	}
	.dropdown-content {
		margin-left: -20px;
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
        <ul><li>Active Appointments (${activeUserAppointments })
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
        <ul><li>Active Appointments (${activeUserAppointments })
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

	 
	
	
	
	<div class="doctor-container">
		<c:forEach items="${allDoctorsList }" var="d">
				 		<div class="doc-tabs">
				 			
				 			<h3>Dr. ${d.doctorFirstName }&nbsp;${d.doctorLastName }</h3>
				 			<p>
				 			 ${d.education}
				 			</p>
				 			
				 			<P>Specialized in ${d.specialization }</P>
				 			<p>${d.experience } Years of Experience</p>
				 			
				 		</div>
				 	
	  </c:forEach>
	</div>
	
	
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("currentUserName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("userAccountId")%></a> <a
						href="userdetails.jsp">My Details</a> <a
						href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="scroll">
		<table>
			<%
			if (first == false) {

				out.println("<h1>doctors currently unavailable</h1>");
			} else {
				out.println("<tr>");
				out.println("<th>Prefix</th>");
				out.println("<th>First Name</th>");
				out.println("<th>Last Name</th>");
				out.println("<th>Gender</th>");
				out.println("<th>Education</th>");
				out.println("<th>Specialization</th>");
				out.println("<th>Experience (in years)</th>");
				out.println("</tr>");
				while (rs2.next()) {
					out.println("<tr>");
					out.println("<td>" + "Dr" + "</td>");
					out.println("<td>" +rs2.getString("doctor_firstname") + "</td>");
					out.println("<td>" + rs2.getString("doctor_lastname") + "</td>");
					out.println("<td>" + rs2.getString("gender") + "</td>");
					out.println("<td>" + rs2.getString("education") + "</td>");
					out.println("<td>" + rs2.getString("specialization") + "</td>");
					out.println("<td>" + rs2.getInt("experience") + "</td>");
					out.println("</tr>");

				}
			}
			%>
		</table>
	</div>

	<div class="back">
		<form action="usermodule.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
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
        }
      });
	
	</script>
</body>
</html>
