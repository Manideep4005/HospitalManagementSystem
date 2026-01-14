 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="adminSessionValidate.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminSessionValidate.jsp"%>
<%
Integer id = (Integer) session.getAttribute("adminAccountId");
String userName = (String) session.getAttribute("adminName");
%>

<%
String FirstName = "";
String lastName = "";
String email = "";
String gender = "";
String address = "";
String password = "";
long contact = 0;

PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from admin where admin_id = ?");
pstmt.setInt(1, id);

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	FirstName = rs.getString("admin_firstname");
	lastName = rs.getString("admin_lastname");
	email = rs.getString("email");
	gender = rs.getString("gender");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	password = rs.getString("password");
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
 	
 	max-width: 500px;
 	margin: 20px auto;
 	border-radius: 5px;
 	background: #F8F8FF;
 	color: #1E293B;
 	padding: 20px;
 }
 
 .container > .profile_tab >  h4 {
 	
 	margin: 8px 2px;
 	box-shadow: 0 0 1px grey;
 	padding: 8px;
 	border-radius: 5px;
 	font-size: 14px;
 }
 
 .operations {
 	border-radius: 5px;
 	padding: 20px;
 	display: flex;
 	gap: 12px;
 	justify-content: space-between;
 	margin: 30px auto;
 	background: #f5f5f5;
 }
 
 
 .operations > button {
 	
 	outline: none;
 	border: none;
 	padding: 10px;
 	border-radius: 5px;
 	cursor: pointer;
 	transition: .4s;
 }
 
 
 #update_btn {
 	background: dodgerblue;
 	color: white;
 	opacity: 0.9;
 }
 
 #update_btn:hover {
 	opacity: 1;
 }
 
 #change_password_btn {
 	color: white;
 	background: blue;
 	opacity: 0.7;
 	
 }
 
 #change_password_btn:hover {
 	opacity: 1;
 }
 
 
 #delete_account_btn {
 	color: white;
 	background: tomato;
 	
 }
 
 #delete_account_btn:hover {
 	background: red;
 }
 
 
 #successMessage {
 	display: none;
 	color: green;
 	background: lightgreen;
	font-size: 14px;
 	padding: 10px;
 	border-radius: 5px;
 	margin-bottom: 5px;
 }
 
  /* Modal is hidden initially */
    .modal {
        display: none; /* Hide initially */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
        align-items: center;
        justify-content: center;
    }

    /* Modal Box */
    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        width: 350px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.3s ease-in-out;
    }

    /* Fade-in Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Close Button */
    .close {
        float: right;
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
        color: #333;
    }

    .close:hover {
        color: red;
    }

    /* Buttons */
    .modal-buttons {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        gap: 15px;
    }

    .cancel, .delete {
        padding: 10px 15px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    .cancel {
        background-color: #ccc;
        color: black;
    }

    .cancel:hover {
        background-color: #bbb;
    }

    .delete {
        background-color: red;
        color: white;
    }

    .delete:hover {
        background-color: darkred;
    }

<style type="text/css">
* {
	box-sizing: border-box;
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

@media screen and (max-width:600px) {
	th, td {
		padding: 0px, 0px;
		font-size: 10px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	.details {
		padding: 5px;
		width: 300px;
	}
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.details {
	margin: 10px auto;
	width: 500px;
}

table {
	margin: auto;
	margin-top: 2%;
	border-radius: 10px;
	background-color: transparent;
	border: 1px solid #ccc;
	border-spacing: 0;
	border-collapse: collapse;
}

th, td {
	font-size: 20px;
	padding: 10px 15px;
	border: 1px solid gainsboro;
}

td {
	background: #f9f9f9;
}

th {
	background: #ccc;
}

.operations {
	width: 300px;
	margin: auto;
}

.operations form {
	width: 200px;
	margin: auto;
}

.operations form button {
	display: block;
	margin: 12px auto;
	width: 100%;
	font-size: 17px;
	background: #778899;
	border: 2px solid #778899;
	padding: 10px;
	cursor: pointer;
	transition-duration: .4s;
	color: white;
}

.operations form button:hover {
	background: black;
	color: white;
	border-color: black;
}

#back_home button {
	border: 2px solid #778899;
	color: #778899;
	background: white;
}

#back_home button:hover {
	color: black;
	border-color: black;
}

#success {
	margin: 10px auto;
	background: rgba(208, 240, 192, 1);
	border: 1px solid green;
	padding: 12px;
	border-radius: 1px;
	color: green;
}

#error {
	margin: 10px auto;
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
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


 



	
	
	
	
	<div class="container">
	
		 <p id="successMessage">Password Updated Successfully</p>
		
		<div class="profile_tab">
			<c:forEach items="${adminData}" var="a">
				<p>Id</p>
				<h4>${a.admin_id}</h4>
				<p>First Name</p>
				<h4>${a.firstName}</h4>
				<p>Last Name</p>
				<h4>${a.lastName}</h4>
				<p>Gender</p>
				<h4>${a.gender}</h4>
				<p>Mobile Number</p>
				<h4>${a.contact}</h4>
				<p>Email</p>
				<h4>${a.email}</h4>
				<p>Address</p>
				<h4>${a.address}</h4>
			</c:forEach>
		</div>
				
	
		<div class="operations">
				<button type="submit" id="update_btn" onclick="navigate('AdminProfileDetails')">Update Profile</button>
				<button type="submit" id="change_password_btn" onclick="navigate('adminChangePassword.jsp')">Change Password</button>
				<button type="button" id="delete_account_btn" onclick="openModal()">Delete Account</button>

		</div>
	
	</div>
	
	
	

 
			
<!-- Custom Modal Overlay (Initially Hidden) -->
<div id="deleteAccountModal" class="modal">
    <div class="modal-content">
        <h2>Confirm Account Deletion</h2>
        <p>Are you sure you want to delete your account? This action cannot be undone.</p>
        <div class="modal-buttons">
            <button class="cancel" onclick="closeModal()">Cancel</button>
            <button class="delete" onclick="deleteAccount()">Delete</button>
        </div>
    </div>
</div>		   
					  
					  
						
						

				
				
	 
	
		
		
		
	

	 
<script type="text/javascript" src="JS/script.js"></script>
<script type="text/javascript">
	
	function navigate(url) {
		window.location.href = url;
	}
	
	
	// Function to get URL parameters
    function getQueryParam(param) {
        let urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    // Get success message from URL
    let successMessage = getQueryParam("success");
    
    if (successMessage) {
        let messageElement = document.getElementById("successMessage");
        messageElement.textContent = successMessage;
        messageElement.style.display = "block";

        // Optionally, remove the message after 5 seconds
        setTimeout(() => {
            messageElement.style.display = "none";
            window.history.replaceState({}, document.title, window.location.pathname); // Remove query param from URL
        }, 5000);
    }

    function openModal() {
        document.getElementById("deleteAccountModal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("deleteAccountModal").style.display = "none";
    }

    function deleteAccount() {
        window.location.href = "AdminDeleteProfile"; // Redirect on delete
    }
    
</script>
</body>
</html>

 
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

					<a href="LogoutAdminServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="container">


		<c:if test="${adminUpdateSuccess != null}">
			<div id="success">${adminUpdateSuccess }</div>
		</c:if>

		<c:if test="${adminUpdateError != null}">
			<div id="error">${adminUpdateError }</div>
		</c:if>


		<div class="details">
			<table>
				<tr>
					<th>ID:</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>First Name:</th>
					<td><%=FirstName%></td>
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
					<th>Password:</th>
					<td><%=password%></td>
				</tr>
			</table>
		</div>

		<div class="operations">
			<form method="post" action="AdminProfileDetails" id="update_profile">
				<button type="submit">Update Profile</button>
			</form>
			<form method="post" action="adminChangePassword.jsp"
				id="change_password">
				<button type="submit">Change Password</button>
			</form>
			<form method="post" action="adminmodule.jsp" id="back_home">
				<button type="submit">Back to Home</button>
			</form>
		</div>
	</div>
	
	
	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('error');
		get.style.display = 'none';
		}, 6000);
	</script>
</body>
</html>

<%
session.removeAttribute("adminUpdateSuccess");
session.removeAttribute("adminUpdateError");
%>
