<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>





<%
Integer id = (Integer) session.getAttribute("userAccountId");
String userName = (String) session.getAttribute("currentUserName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Welcome</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
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

body {
font-family: 'Poppins', sans-serif;
	background-image: white;
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
        background: white;
        top: 0;
        position: sticky;
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
      


.change {
	max-width: 800px;
	margin: 30px auto;
	padding: 20px;
}

.change form {
	border: 3px solid transparent;
	max-width: 500px;
	box-shadow: 0px 0px 10px 1px gainsboro;
	padding: 20px;
	border-radius: 10px;
	margin: 20px auto;
}


<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	background-image: white;
}

.header {
	text-align: center;
	padding: 10px 0px;
	margin-top: 0px;
	color: black;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	color: black;
	text-decoration: underline;
	text-decoration-color: #168AAa;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid gray;
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
	transition: 0.4s ease;
}

li a:hover, .dropdown:hover {
	background-color: #ccc7bf;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	margin-left: -40px;
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
	background-color: #ccc7bf;
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
	font-weight: 300;
}

.dropbtn span:hover {
	font-weight: 500;
	color: black;
}

.dropbtn span {
	font-weight: 500;
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
	padding: 20px 5px;
	color: white;
	height: 100%;
}

.button-icon {
	font-size: 1.5em;
}

label {
	margin-top: 10px;
	font-size: 20px;
	color: black;
	font-weight: 200;
}

input {
	width: 100%;
	margin: 8px 0;
	padding: 12px 10px;
input[type=password] {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
	border: 2px solid #808080;
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	font-size: 18px;
	background-color: transparent;
	transition: 0.34s ease;
}

input:focus {
	border: 2px solid #317AC7;
}

input:hover {
box-shadow: 0 0 8px #168AaA;
border-color: transparent;
}


.change form button {
	padding: 12px 20px;
	font-size: 18px;
input[type=password]:focus {
	border: 2px solid #317AC7;
}

.change form {
	border: 3px solid transparent;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0px 0px 0px 1px #808080;
	margin-top: 5%;
	padding: 20px;
}

.change form button {
	padding: 16px 32px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #168AAa;
	background-color: #168AaA;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
	color: white;
	margin: 8px 0; 
	display: block;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	opacity: 0.8;
}

.change form button:hover {
	opacity: 1;
	margin-top: 5px; 
	display: block;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
}

.change form button:hover {
	color: black;
	background-color: white;
}

#demo {
	margin: 0;
	color: red;
	font-weight: bold;
	padding-left: 2%;
}

#demo1, .error {
	font-weight: bold;
	margin: 0;
	color: green;
	padding-left: 2%;
}

.error {
	font-weight: bold;
	color: red;
	font-size: 18px;
	margin-bottom: 12px;
	padding-left: 0px;
}

 

#back {
	width: 200px;
@media screen and (max-width: 600px) {
	.change form {
		width: 320px;
	}
	li a {
		padding: 10px 8px;
	}
	a img {
		width: 0.8em;
	}
}

#back {
	width: 100px;
	margin-top: 2%;
	margin-left: auto;
	margin-right: auto;
}

.btn {
	display: block;
	margin-left: auto;
	margin-right: auto;
	padding: 12px 20px;
	font-size: 18px;
	margin-left: auto;
	padding: 16px 32px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #008CBA;
	font-weight: 600;
	cursor: pointer;
	width: 100%;
	transition-duration: 0.4s;
	color: #008cba;
	transition-duration: 0.4s;
}

.btn:hover {
	color: white;
	background-color: #008CBA;
}

.change input.invalid {
	border: 2px solid red;
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

	
	<div class="change">
		<form action="ChangeUserPasswordServlet" method="post"
			onsubmit="return validateForm()">
			<p class="error">${errorPassword }</p>
			<label for="password">Enter new Password</label> <input
				type="password" name="newpassword"   id="pass" class="one" oninput="this.className=''" onkeyup=" check()"> <label
				for="password">Re-Enter Password</label> <input type="password"
				name="newpassword1"  id="repass" class="one" oninput="this.className=''" onkeyup=" check()">
			<p id="demo"></p>
			<p id="demo1"></p>
			<button type="submit">Reset</button>
		</form>
	</div>


	<div id="back">
		<form action="usermodule.jsp" method="post">
			<button type="submit" class="btn">Back</button>
		</form>

	</div>
<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo').innerHTML = '';
			return false;
		} else if (pass != repass) {
			document.getElementById('demo').innerHTML = 'Password doesn\'t match';
			document.getElementById('demo').style.color = 'red';
			return false;
		} else {
			document.getElementById('demo').innerHTML = 'Password matched';
			document.getElementById('demo').style.color = 'green';
			return true;
		}
	}
	
	
	function validateForm() {
		var y = document.getElementsByClassName('one');
		var i, valid = true;
		for (i = 0; i < y.length; i++) {
			if (y[i].value == "") {
				y[i].className += " invalid";
				valid = false;
			}
		}
		var pass = check();
		
		var final = valid && pass;
		
		return final;
	}
	
	
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
</script>

</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=id%></a> <a href="userdetails.jsp">My
						Details</a> <a href="userAppointmentHistory.jsp">Appointment
						History</a> <a href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>

	<div class="header">
		<p>Change Password</p>

	</div>


	<div class="change">
		<form action="ChangeUserPasswordServlet" method="post"
			onsubmit="return validateForm()">
			<p class="error">${errorPassword }</p>
			<label for="password">Enter new Password</label> <input
				type="password" name="newpassword"   id="pass" class="one" oninput="this.className=''" onkeyup=" check()"> <label
				for="password">Re-Enter Password</label> <input type="password"
				name="newpassword1"  id="repass" class="one" oninput="this.className=''" onkeyup=" check()">
			<p id="demo"></p>
			<p id="demo1"></p>
			<button type="submit">Reset</button>
		</form>
	</div>


	<div id="back">
		<form action="userdetails.jsp" method="post">
			<button type="submit" class="btn">Back</button>
		</form>

	</div>

</body>
</html>
