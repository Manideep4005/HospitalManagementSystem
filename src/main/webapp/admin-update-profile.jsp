<%@page import="java.util.Iterator"%>
<%@page import="com.hms.admin.AdminBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

<%@include file="adminSessionValidate.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<%
ArrayList<AdminBean> aList = (ArrayList) session.getAttribute("adminList");
AdminBean aBean = new AdminBean();
Iterator<AdminBean> itr = aList.iterator();

Integer aId = null;
String firstName = "";
String lastName = "";
String gender = "";
String email = "";
String address = "";
Long contact = null;

while (itr.hasNext()) {
	aBean = itr.next();
	aId = aBean.getAdmin_id();
	firstName = aBean.getFirstName();
	lastName = aBean.getLastName();
	gender = aBean.getGender();
	email = aBean.getEmail();
	address = aBean.getAddress();
	contact = aBean.getContact();

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account | HMS</title>
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
	width: 500px;
}

body {
	margin: 0;
	/*background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
	font-family: 'Poppins', sans-serif;
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
	font-weight: bolder;
	transition: 0.1s ease;
	border-radius: 5px;
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

.container {
	width: 520px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 1px 0px grey;
}

form {
	margin: 0px auto;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 0 5px 1px dodgerblue;
}

form {
	width: 500px;
	margin: 0px auto;
	padding: 15px;
}

#adminId {
	border-color: #f7f7f7;
	cursor: not-allowed;
	background: #f7f7f7;
}

input, textarea, select, button {
	display: block;
	margin: 12px 0;
	padding: 10px 12px;
	border: 1px solid gainsboro;
	border: 1px solid dodgerblue;
	border-radius: 5px;
	resize: none;
	outline: none;
	background: transparent;
	transition-duration: .4s;
	width: 100%;
	color: grey;
	font-size: 18px;
}

input:focus, textarea:focus, select:focus {
	border-color: transparent;
	box-shadow: 0 0 0 2px #168aaa;
}

button {
	border: 1px solid dodgerblue;
	border: 2px solid dodgerblue;
	background: white;
	color: dodgerblue;
	cursor: pointer;
}

button:hover {
	background: dodgerblue;
	color: white;
}

.back {
	width: 100px;
	width: 200px;
	margin: 10px auto;
}

.back a {
	text-decoration: none;
	text-align: center;
	display: block;
	padding: 10px;
	background: dodgerblue;
	color: white;
	border-radius: 5px;
	transition-duration: .4s;
}

.back a:hover {
	transform: scale(0.9);
	transform: scale(1.2);
}

@media screen and (max-width:600px) {
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -20px;
	}
	form {
		width: 300px;
	}
	.container {
		width: 320px;
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


 

	<div class="topnav">
		<ul>
			<li><a href="adminmodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text">${adminName }</span>
			</a>
				<div class="dropdown-content">
					<a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="container">
		<div class="f">
			<form action="AdminUpdateProfile" method="POST">
			
			<c:forEach items="${adminList}" var="a">
			
				<input type="hidden" name="adminId" required value="${a.admin_id }"> <input
					type="text" required disabled="disabled" value="${a.admin_id }" id="adminId">
				<input type="text" required name="first_name"
					placeholder="Enter First Name" value="${a.firstName }"> <input
					type="text" required name="last_name" placeholder="Enter Last Name"
					value="${a.lastName}"> <input type="email" required="required"
					name="email" value="${a.email }" placeholder="Enter Email"> <select
					name="gender" id="gender"
					onchange="this.className=this.options[this.selectedIndex].className"
					required="required">
					<option value="${a.gender}" selected="selected" hidden="">${a.gender }</option>
				<input type="hidden" name="adminId" required value="<%=aId%>"> <input
					type="text" required disabled="disabled" value="<%=aId%>" id="adminId">
				<input type="text" required name="first_name"
					placeholder="Enter First Name" value="<%=firstName%>"> <input
					type="text" required name="last_name" placeholder="Enter Last Name"
					value="<%=lastName%>"> <input type="email" required="required"
					name="email" value="<%=email%>" placeholder="Enter Email"> <select
					name="gender" id="gender"
					onchange="this.className=this.options[this.selectedIndex].className"
					required="required">
					<option value="<%=gender%>" selected="selected" hidden=""><%=gender%></option>
					<option value="male" class="optionColor">Male</option>
					<option value="female" class="optionColor">Female</option>
				</select>
				<textarea rows="1" cols="0" required="required"
					placeholder="Enter your Address" name="address">${a.address }</textarea>
				<input type="text" inputmode="numeric" name="contact"
					pattern="[0-9]{10}" title="Enter Moible Number" maxlength="10"
					placeholder="Enter Mobile Number" required value="${a.contact }"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
				<button type="submit">Update</button>
				
				</c:forEach>
					placeholder="Enter your Address" name="address"><%=address%></textarea>
				<input type="text" inputmode="numeric" name="contact"
					pattern="[0-9]{10}" title="Enter Moible Number" maxlength="10"
					placeholder="Enter Mobile Number" required value="<%=contact%>"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
				<button type="submit">Update</button>
			</form>
		</div>

		<div class="back">
			<a id="back_btn" href="admindetails.jsp">Go Back</a>
		</div>
	</div>




	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('message');
		get.style.display = 'none';
		}, 6000);
	</script>
<script type="text/javascript" src="JS/script.js"></script>


</body>
</html>

