<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<<<<<<< HEAD
 
=======
<%
Integer id = (Integer) session.getAttribute("adminAccountId");
String userName = (String) session.getAttribute("adminName");
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>Change Admin Password | HMS</title>
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
	
	max-width: 400px;
	margin: 60px auto;
	border: 0.1px solid grey;
	border-radius: 10px;
	padding: 20px;
 
=======
<title>Change Password Admin | HMS</title>
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
	background-image: white;
}

.header {
	background-color: white;
	text-align: center;
	padding: 10px 0px;
	height: auto;
	margin-top: 0px;
}

.header p {
	margin: 0;
	font-weight: 1000;
	font-size: 20px;
	text-decoration: underline;
	color: black;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	background-color: white;
	box-shadow: 0 0 10px gray;
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
	transition-duration: 0.4s;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;
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
	font-weight: 300;
}

.dropbtn span:hover {
	color: black;
}

.dropbtn span {
	font-weight: 600;
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

label {
	display: block;
<<<<<<< HEAD
	color: grey;
	font-size: 16px;
}

input {
	width: 100%;
	margin: 10px 0;
	padding: 12px;
	display: inline-block;
	border: 1px solid #808080;
=======
	font-size: 20px;
	color: black;
	font-weight: 200;
	font-size: 20px;
}

input[type=password] {
	width: 100%;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
	border: 2px solid #808080;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	box-sizing: border-box;
	outline: none;
	border-radius: 5px;
	background-color: transparent;
<<<<<<< HEAD
	font-size: 14px;
	transition-duration: 0.34s ease;
}

input:focus {
	border: 1px solid #317AC7;
}



 

 
button {
	margin: 10px 0;
=======
	transition-duration: 0.34s ease;
}

input[type=password]:focus {
	border: 2px solid #317AC7;
}

 

#show {
	background-color: #168AAa;
	padding: 12px 20px;
	border-radius: 5px;
	transition-duration: .4s;
	border: 2px solid #317ac7;
	color: white;
	margin-left: 3%;
	cursor: pointer;
	display: inline-block;
}

.change form {
	border: 3px solid transparent;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 0px 0px 0px 1px #808080;
	margin-top: 3%;
	padding: 20px;
}

button {
>>>>>>> e06896c5d3b881a587992830e685134132707732
	background-color: #168AAa;
	width: 100%;
	color: white;
	padding: 12px 10px;
<<<<<<< HEAD
	font-size: 15px;
	border: none;
	cursor: pointer;
=======
	font-size: 17px;
	margin: 10px 0px;
	border: none;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	text-align: center;
	display: block;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: 0.4s;
}

button:hover {
	background-color: dodgerblue;
	color: white;
}

#demo {
<<<<<<< HEAD
	font-size: 14px;
	color: red;
}

 

 
=======
	margin: 0;
	color: red;
	padding-left: 2%;
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	.change form {
		width: 320px;
	}
	input[type=password] {
		width: 100%;
	}
}

.back button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	padding: 12px 10px;
	font-size: 17px;
	color: dodgerblue;
	border: 2px solid dodgerblue;
	transition-duration: .4s;
	cursor: pointer;
	background: transparent;
	width: 20%;
}

.back button:hover {
	background-color: dodgerblue;
	color: white;
	border-color: transparent;
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
    <form action="ChangeAdminPasswordServlet" method="post" onsubmit="return check()">
        <p style="color: red; font-size: 14px; margin: 5px 0;">${adminPasswordError }</p>
        <label for="password">Enter new Password</label> 
        <input type="password" name="newpassword" id="pass" placeholder="Enter Password" onkeyup="check()">
        
        <label for="password">Re-Enter Password</label> 
        <input type="password" name="newpassword1" id="repass" placeholder="Re-Enter Password" onkeyup="check()">

        <p id="demo"></p>
        <button type="submit">Reset</button>
    </form>
</div>


	
=======
	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=userName%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=id%></a> <a href="admindetails.jsp">My
						Details</a> <a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="change">
		<form action="ChangeAdminPasswordServlet" method="post"
			onsubmit="return check()">
			<p style="color: red; font-size: 18px;">${adminPasswordError }</p>
			<label for="password">Enter new Password</label> <input
				type="password" name="newpassword" id="pass"  ><label for="password">Re-Enter
				Password</label> <input type="password" name="newpassword1" id="repass"
				onkeyup="check()"  > 
			<p id="demo"></p>
			<button type="submit">Reset</button>
		</form>
	</div>

	<div class="back">
		<form action="admindetails.jsp">
			<button type="submit" class="">Back</button>
		</form>
	</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732






<script type="text/javascript">
<<<<<<< HEAD

function navigate(url) {
	window.location.href = url;
}


function check() {
    var pass = document.getElementById('pass').value;
    var repass = document.getElementById('repass').value;
    var message = document.getElementById('demo');

    // Show error while typing in the first field
    if (pass.length === 0) {
        message.innerHTML = '';
        return false;
    } 
    if (pass.length < 8) {
        message.innerHTML = 'Password must be at least 8 characters long';
        message.style.color = 'red';
        return false;
    } 

    // If both fields are filled, check for match
    if (repass.length > 0) {
        if (pass !== repass) {
            message.innerHTML = "Passwords don't match";
            message.style.color = 'red';
            return false;
        } else {
            message.innerHTML = 'Password matched';
            message.style.color = 'green';
            return true;
        }
    } else {
        message.innerHTML = '';  // Don't show an error if the second field is empty
    }

    return true;
}

</script>


<script type="text/javascript" src="JS/script.js"></script>
=======
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo').innerHTML = '';
			return false;
		} else if (repass.length <= 7) {
			document.getElementById('demo').innerHTML = 'Password must be 8 characters long';
			document.getElementById('demo').style.color = 'red';
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

	 
</script>


>>>>>>> e06896c5d3b881a587992830e685134132707732









</body>
</html>

<<<<<<< HEAD
 
=======

<%
session.removeAttribute("adminPasswordError");
%>
>>>>>>> e06896c5d3b881a587992830e685134132707732
