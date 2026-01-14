<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>Patient Search | Hospital Management System</title>
=======
<title>Patient Details | HMS</title>
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
	padding: 20px;
	max-width: 350px;
	border: 1px solid grey;
	border-radius: 5px;
	margin: 5% auto;
}

.container > form > label {
=======

<style type="text/css">
* {
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
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
	border-bottom: 1px solid black;
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
	transition: 0.34s;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
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
	transition: 0.34s ease;
}

.dropdown-content a:hover {
	background-color: #eba46e;
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
	font-size: 1.5em;
}

input::placeholder {
	font-weight: bold;
	opacity: 0.6;
	font-size: 15px;
}

label {
>>>>>>> e06896c5d3b881a587992830e685134132707732
	font-size: 20px;
	color: midnightblue;
	font-weight: 200;
}

<<<<<<< HEAD
.container > form > input {
	width: 100%;
	margin: 8px 0;
	padding: 12px;
=======
input {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	border: 2px solid #168aaa;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
<<<<<<< HEAD
	font-size: 14px;
=======
	font-size: 18px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	color: #808080;
	transition-duration: .4s;
}

<<<<<<< HEAD
.container > form > input:focus {
	border-color: dodgerblue;
}

#demo  {
	font-size: 14px;
	margin: 5px 0;
=======
input:focus {
	border: 2px solid darkorange;
}

#f1 {
	width: 500px;
	box-shadow: 0px 0px 10px 2px #F6D7AF;
	border-radius: 1%;
	margin-right: auto;
	margin-left: auto;
	padding: 50px 30px;
}

#f1 button {
	background-color: #168AAD;
	width: 100%;
	color: white;
	padding: 12px 20px;
	margin: 10px 0px;
	border: none;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	transition-duration: .4s;
}

#f1 button:hover {
	background-color: #eba46e;
}

h1 {
	text-align: center;
	font-family: cursive;
}

#demo, #demo1 {
	font-size: 15px;
	margin-top: 0;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	padding-left: 10px;
	color: red;
}

<<<<<<< HEAD
.container > form > button {
	font-size: 14px;
	color: white;
	background: dodgerblue;
	padding: 12px;
	outline: none;
	border: 1px solid transparent;
	border-radius: 5px;
	opacity: 0.8;
	cursor: pointer;
	transition: .4s;
	width: 100%;
}

=======
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
 
=======


@media screen and (max-width:600px){
	li a {
		padding: 10px 5px;
	}
	
	#f1 {
		width: 320px;
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
              <li><a href="admindetails.jsp">View Profile</a></li>

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
              <li><a href="admindetails.jsp">View Profile</a></li>

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
			<form action="AdminGetPatientServlet" id="f1" method="post"
				onsubmit="return validateForm()">
				<label>Patient Id</label> 
				<input type="text" name="patientid"
					maxlength="5" placeholder="Enter Patiend id...." id="one" autocomplete="off">
				<p id="demo"></p>
				<button type="submit">Submit</button>

			</form>
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
					<a href="admindetails.jsp">My Account</a> <a
						href="adminViewPatients.jsp">Patients List</a> <a
						href="LogoutAdminServlet">Logout</a>
				</div></li>
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


	<div class="get_details">
		<div class="search">
			<h1>Get Details</h1>
			<form action="adminGetPatientDetails.jsp" id="f1" method="post"
				onsubmit="return validateForm()">
				<label>Patient Id</label> <input type="text" name="patientid"
					maxlength="5" placeholder="Enter Id..." id="one">
				<p id="demo"></p>
				<!-- <label>Mobile Number</label>
            <input type="text" name="mobilenumber" maxlength="10" id="one1" placeholder="Contact..." >
            <p id="demo1"></p>- -->
				<button type="submit">Submit</button>

			</form>
		</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732
	</div>




	<script type="text/javascript">
		function validateForm() {
			var x = document.getElementById("one").value;

			if (isNaN(x)) {
				document.getElementById("demo").innerHTML = "Enter Numeric digits only";
				return false;
			}
			if (x.length == "" || x.length < 5) {
				document.getElementById("demo").innerHTML = "please enter 5 digit ID";
				return false;
			} else {

				return true;
			}

		}
 
	   
	</script>

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