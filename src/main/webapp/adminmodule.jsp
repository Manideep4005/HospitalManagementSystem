<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>

<%@include file="adminSessionValidate.jsp"%>




 
<%

Integer adminId = (Integer)session.getAttribute("adminValidateId");
// JDBC CODE TO GET USER NAME
PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select admin_firstname, admin_lastname, admin_id, email from admin where admin_id = ?");
pstmt.setInt(1, adminId);

Integer aId = 0;
String adminFirstName = "";
String adminLastName = "";
String email = "";
ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	aId = rs.getInt("admin_id");
	adminFirstName = rs.getString("admin_firstname");
	adminLastName = rs.getString("admin_lastname");
	email = rs.getString("email");
}

session.setAttribute("adminEmail", email);
session.setAttribute("adminLogoutName", adminFirstName + " " + adminLastName);
session.setAttribute("adminAccountId", new Integer(aId));
session.setAttribute("adminName", adminFirstName + " " + adminLastName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Admin Dashboard | Hospital Management System</title>
<title>Welcome | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />
<meta charset="utf-8" />
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

<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
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
  transition: width 0.25s ease-in-out; /* smoother + faster */
  will-change: width; /* performance optimization */
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



    

        .container {
            max-width: 1000px;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            padding: 20px;
        }

        .card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            text-align: center;
            border: 1px solid #ddd;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .card i {
            font-size: 30px;
            margin-bottom: 10px;
            color: #555;
            padding: 12px;
            border-radius: 50%;
            background: #f5f5f5;
        }

        .card h3 {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
            font-weight: 500;
        }

        .card i.blue { color: #3498db; background-color: rgba(52, 152, 219, 0.1); }
        .card i.green { color: #2ecc71; background-color: rgba(46, 204, 113, 0.1); }
        .card i.red { color: #e74c3c; background-color: rgba(231, 76, 60, 0.1); }
        .card i.yellow { color: #f1c40f; background-color: rgba(241, 196, 15, 0.1); }
        .card i.purple { color: #9b59b6; background-color: rgba(155, 89, 182, 0.1); }
        .card i.teal { color: #1abc9c; background-color: rgba(26, 188, 156, 0.1); }
        .card i.orange { color: #e67e22; background-color: rgba(230, 126, 34, 0.1); }
        .card i.gray { color: #7f8c8d; background-color: rgba(127, 140, 141, 0.1); }






.header {
	background: white;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	text-align: center;
}

.topnav {
	position: sticky;
	top: -1px;
	backdrop-filter: blur(10px);
	box-shadow: 0px 0px 10px 0px grey;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: white;
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
	padding: 12px 16px;
	text-decoration: none;
	font-weight: 600;
	transition-duration: 0.4s;
}

li a:hover, .dropdown:hover {
	background-color: dodgerblue;
	color: white;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	margin-left: -40px;
	box-shadow: 0px 8px 16px 0px #008cba;
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
}

.dropdown-content a:hover {
	background-color: dodgerblue;
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
	transition: 0.3s;
}

.dropbtn span:hover {
	font-weight: 1000;
	color: white;
}

.dropbtn span {
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

.container {
	display: grid;
	grid-template-columns: auto auto;
	align-content: center;
	justify-content: space-evenly;
	transition-duration: 0.4s;
	gap: 50px;
	padding: 20px;
	margin-top: 20px;
}

.item {
	width: 400px;
	padding: 20px;
	text-align: center;
	box-shadow: 0 0 15px dodgerblue;
	border-radius: 10px;
	transition-duration: 0.4s;
	border: 2px solid transparent;
	animation: shape 5s infinite;
}

.item:hover {
	box-shadow: 0 0 0 1px #008cba, 0 0 10px dodgerblue;
	animation: none;
}

.item p {
	font-size: 18px;
	font-weight: 700;
}

.item button {
	display: block;
	margin-right: auto;
	margin-left: auto;
	padding: 12px;
	border: 2px solid #008cba;
	background-color: #008cba;
	color: white;
	font-weight: 700;
	font-size: 17px;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: 0.4s;
}

.item button:hover {
	border: 2px solid dodgerblue;
	background-color: white;
	color: black;
}

@keyframes shape { 50% {
	border-radius: 10px;
	border-color: #008CBA;
	box-shadow: none;
}

}
@media screen and (max-width: 1000px) {
	.container {
		grid-template-columns: auto;
		gap: 80px;
	}
}

@media screen and (max-width: 600px) {
	.container {
		grid-template-columns: auto;
		gap: 45px;
	}
	.item {
		width: 300px;
	}
	li a {
		padding: 10px 5px;
		font-size: 15px;
	}
	.header {
		display: none;
	}
	.dropdown-content {
		margin-left: -10px;
		min-width: 100px;
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










<!-- 
 
	<div class="topnav">

		<div class="header">
			<p>Welcome Hospital Management System</p>
		</div>
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png" /></span> <span class="button-text"><%=adminFirstName + " " + adminLastName%></span>
			</a>

				<div class="dropdown-content">
					<a href="#">My ID: <%=adminId%></a> <a href="admindetails.jsp">My
						Account</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="container">
		<div class="item" >
			<p>Doctors List</p>
			<form action="DisplayAllDoctorsServlet" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Admin's & User's</p>
			 
				<button type="submit" id="admin-user-btn">Click Here</button>
			 
			<p>Admins & Users</p>
			<form action="adminAdministration.jsp" method="post">
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Patients List</p>
			<form action="adminPatientList.jsp" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Appointments</p>
			<form action="adminAppointmentPage.jsp" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Register Doctor</p>
			<form action="doctorregister.jsp" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Delete Doctor</p>
			<form action="adminDeleteDoctor.jsp" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Search Patient</p>
			<form action="adminSearchPatient.jsp" method="post">
				<button type="submit">Click Here</button>
				<button type="submit">click here</button>
			</form>
		</div>

		<div class="item">
			<p>Patient Details</p>
			<form action="adminGetPatient.jsp" method="post">
				<button type="submit">Click Here</button>
			</form>
		</div>
	</div> -->
	
	<div class="container">
        <div class="card" onclick="navigate('DisplayAllDoctorsServlet')" >
            <i class="fas fa-user-md blue"></i>
            <h3>Doctors List</h3>
        </div>
        <div class="card" onclick="navigate('doctorregister.jsp')">
            <i class="fas fa-user-plus green"></i>
            <h3>Register Doctor</h3>
        </div>
        
        <div class="card" onclick="navigate('adminPatientList.jsp')">
            <i class="fas fa-users yellow"></i>
            <h3>Patients List</h3>
        </div>
        <div class="card" onclick="navigate('adminSearchPatient.jsp')">
            <i class="fas fa-search purple"></i>
            <h3>Search Patient</h3>
        </div>
        <div class="card" onclick="navigate('adminGetPatient.jsp')">
            <i class="fas fa-user-injured teal"></i>
            <h3>Patient Details</h3>
        </div>
        <div class="card" onclick="navigate('adminAppointmentPage.jsp')">
            <i class="fas fa-calendar-alt orange"></i>
            <h3>Appointments</h3>
        </div>
        <div class="card"  id="admin-user-btn">
            <i class="fas fa-user-shield gray"></i>
            <h3>Admin & Users</h3>
        </div>
    </div>

	
	
	
	<!-- USERS AND ADMIN MODAL -->
	<div class="modal-user-admin">
		
		<div class="close">
			<i class="fa fa-close" id="admin-user-close-btn"></i>
		</div>
		
		<div class="btns">
			
			<div>
			<a href="AdminViewUsersServlet">Get User's Data</a>
		</div>
		
		<div><a href="AdminViewAdminsServlet">Get Admin's Data</a></div>
		
		</div>
	</div>
	
	<div class="overlay-2"></div>
	
	
	<script type="text/javascript" src="JS/script.js"></script>
	<script type="text/javascript">
		
		function openUserAdminModal() {
			document.querySelector('.modal-user-admin').style.display = "block";
			document.querySelector('.overlay-2').style.display = "block";
		}
		
		function closeUserAdminModal() {

			document.querySelector('.modal-user-admin').style.display = "none";
			document.querySelector('.overlay-2').style.display = "none";
		}
		
		const openUserAdminModalBtn = document.getElementById("admin-user-btn");
		const closeUserAdminModalBtn = document.getElementById("admin-user-close-btn");
		const overlay_2 = document.querySelector('.overlay-2');
		
		openUserAdminModalBtn.addEventListener('click', openUserAdminModal);
		closeUserAdminModalBtn.addEventListener('click', closeUserAdminModal);
		overlay_2.addEventListener('click', closeUserAdminModal);
		
		
		   document.addEventListener("keydown", function (e) {
		        if (e.key === "Escape") {
		          closeUserAdminModal();
		        }
		      });
		   
	        function navigate(url) {
	            window.location.href = url;
	        }


	</script>
				<button type="submit">click here</button>
			</form>
		</div>
	</div>
</body>
</html>
