<%@page import="java.time.Instant"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<%
String id = (String) session.getAttribute("userSessionId");
%>

<%
String firstName = "";
String lastName = "";
String password = "";
String email = "";
String gender = "";
String address = "";
long contact = 0;
Date join_date = null;
Timestamp stamp = null;

PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from user where userid = ?");
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();



SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

SimpleDateFormat formatter2 = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");



while (rs.next()) {
	firstName = rs.getString("first_name");
	lastName = rs.getString("last_name");
	password = rs.getString("password");
	email = rs.getString("email");
	gender = rs.getString("gender");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	join_date = rs.getDate("join_date");
	stamp = rs.getTimestamp("passwordchangedate");
}

String passwordChangeDate;
if (stamp != null) {
	passwordChangeDate = formatter2.format(stamp);
} else {
	passwordChangeDate = " ";
}

String joined_date = formatter.format(join_date);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile | HMS</title>
<title>My Account | HMS</title>
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
	margin: 0;
	padding: 0;


<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	/* background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
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
      	padding: 10px;
        box-shadow: 0 0 5px 1px gainsboro;
        position:  sticky;
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
      


 
.details {
	max-width: 1000px;
	margin: 20px auto;
	box-shadow: 0px 0px 5px 1px gainsboro;
	border-radius: 5px;
	padding: 20px;
}

.details > .tabs > div {
	padding: 30px;
}

.details > .tabs > div > p {
	font-weight: 500;
	font-size: 18px;
	margin: 10px 0;
}

.details > .tabs > div > h5 {
	font-size: 16px;
	border: 1px solid gainsboro;
	padding: 10px;
	border-radius: 5px;
}

 

 

.btns {
	max-width: 300px;
	display: flex;
	flex-direction: column; 
	gap: 12px;
}

.btns a {
	max-width: 200px;
	text-align:center;
	text-decoration: none;
	color: white;
	background: dodgerblue;
	font-weight: 500;
	padding: 10px;
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	/*position: fixed;
    width: 100%;*/
	border-bottom: 1.8px solid gainsboro;
	box-shadow: 0 0 5px 1px gainsboro;
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
	font-weight: 700;
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
	margin-left: -80px;
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
	height: 36.6px;
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
	padding: 20px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}



.details {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1%;
	box-shadow: 0px 0px 10px 1px gainsboro;
	border-radius: 5px;
}

th, td {
	font-size: 20px;
	padding: 10px 15px;
	text-align: left;
}


@media screen and (max-width:600px) {
	.details {
		width: 320px;
		padding: 10px;
	}
	
	table {
		padding: 1px;
	}
	
	li a {
		padding: 10px 5px;
	}
	
	.dropdown-content {
	
		margin-left: -20px;
	}
	
	th, td {
		font-size: 15px;
		padding: 10px 5px;
	}
	
 
}

.btns {
	width: 300px;
	margin: 20px auto 30px auto;
	padding: 10px 10px;
	border-radius: 20px;
	box-shadow: 0 0 5px #809080;
}

.btns a {
	margin-left: 15px;
	text-decoration: none;
	color: dodgerblue;
	font-weight: 500;
	transition-duration: .4s;
}

.btns a:hover {
	background: #168aaa;
	color: #168aaa;
	text-decoration: underline;
}

#message {
	color: green;
	text-align: center;
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

	
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=firstName + " " + lastName%></span>
			</a>


				<div class="dropdown-content">
					<a href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>
	
	

	<div class="btns">
		<a href="user-updateprofile.jsp">Update Profile</a>
		<a href="userChangePassword.jsp">Update Password</a>
	</div>
	
	
	
	<c:if test="${passwordChangeSuccessUser != null }">
		<p id="message">${passwordChangeSuccessUser }</p>
	</c:if> 
	
	<c:if test="${userUpdateSucess != null }">
		<p id="message">${userUpdateSucess }</p>
	</c:if> 
	
	
	
	<div class="details">
		<c:forEach items="${userDetails}" var="u">

		 
		
		
		<div class="tabs">
			
			<h3>Personal Information</h3>
			<div>
			<p>User Id</p>
			<h5>${u.userId }</h5>
			<p>First Name</p>
			<h5>${u.firstName }</h5>
			<p>Last Name</p>
			<h5>${u.lastName }</h5>
			<p>Gender</p>
			<h5>${u.gender }</h5>
			</div>
		</div>
		
		<div class="tabs">
			<h3>Contact Information</h3>
			
			<div>
			<p>Email</p>
			<h5>${u.email }</h5>
			<p>Mobile</p>
			<h5>${u.contact }</h5>
			<p>Address</p>
			<h5>${u.address }</h5>
			</div>
		</div>
		
		<div class="tabs">
			
			<h3>Passwords & Other's</h3>
			<div>
			<p>Password Last Changed on</p>
			<h5>${u.passwordChangeDate }</h5>
			<p>Account created on</p>
			<h5>${u.join_date }</h5>
			</div>
		</div>
		</c:forEach>
		
		<div class="btns">
		<a href="user-updateprofile.jsp">Update Profile</a>
		<a href="userChangePassword.jsp">Change Password</a>
		</div>
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
	<div class="details">
		<table>
			<tr>
				<th>ID:</th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th>First Name:</th>
				<td><%=firstName%></td>
			</tr>

			<tr>
				<th>Last Name:</th>
				<td><%=lastName%></td>
			</tr>

			<tr>
				<th>Email:</th>
				<td><%=email%></td>
			</tr>

			<tr>
				<th>Password:</th>
				<td><%=password%> <span><%=passwordChangeDate%></span></td>
			</tr>

			<tr>
				<th>Gender:</th>
				<td><%=gender%></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td><%=address%></td>
			</tr>
			<tr>
				<th>Contact:</th>
				<td><%=contact%></td>
			</tr>
			<tr>
				<th>Joined Date:</th>
				<td><%=joined_date%></td>
			</tr>

		</table>
	</div>

	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('message');
		get.style.display = 'none';
		}, 6000);
	</script>

</body>
</html>

<%session.removeAttribute("passwordChangeSuccessUser");
session.removeAttribute("userUpdateSucess");%>
