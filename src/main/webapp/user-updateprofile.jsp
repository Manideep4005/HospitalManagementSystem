<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Connection"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%

	Integer userId = (Integer)session.getAttribute("userAccountId");
	

	// Setting up the fields values
	String firstName = "";
	String lastName = "";
	String email = "";
	String gender = "";
	String address = "";
	long mobile = 0;


	Connection con = MySqlConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement("select * from user where userid = ?");
	pstmt.setInt(1, userId);
	
	
	ResultSet rs = pstmt.executeQuery();
	
	while (rs.next()) {
		firstName = rs.getString("first_name");
		lastName = rs.getString("last_name");
		email = rs.getString("email");
		gender = rs.getString("gender");
		address = rs.getString("address");
		mobile  = rs.getLong("contact");
	}
	
	

%>

<!DOCTYPE html>
<html>
<head>
<title>Update Profile | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<style type="text/css">
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body {
	/* background-image: linear-gradient(to right, #808080, #778899);*/
	background-color: white;
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


.container {
	width: 520px;
	position: absolute;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 0 5px 1px dodgerblue;
}

 form {
	width: 500px;
	margin: 0px auto;
	padding: 15px;
}

#userId {
	cursor: not-allowed;
	background: #f7f7f7;
}

input, textarea, select, button {
	display: block;
	margin: 12px 0;
	padding: 10px 12px;
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
	border: 2px solid dodgerblue;
	background: white;
	color:dodgerblue;
	cursor: pointer;
}

button:hover {
	background: dodgerblue;
	color:white;
}

.back {
	width: 200px;
	margin: 10px auto;
}

.back a {
	text-decoration: none;
	text-align: center;
	display: block;
	padding: 10px;
	background: dodgerblue;
	color:white;	
	border-radius: 5px;
	transition-duration: .4s;
}

.back a:hover {
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
	<div class="topnav">
		<ul>
			<li><a href="usermodule.jsp">Home</a></li>
			<li><a href="usercontact.jsp">Contact Us</a></li>
			<li><a href="userabout.jsp">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text">${currentUserName }</span>
			</a>


				<div class="dropdown-content">
					<a href="userdetails.jsp">My Profile</a> <a
						href="userAppointmentHistory.jsp">Appointment History</a> <a
						href="LogoutUserServlet">Logout</a>
				</div></li>
		</ul>
	</div>


	<div class="container">
		<div class="f">
			<form action="UserUpdateServlet" method="POST">
				<input type="hidden" name="userId" required value="<%=userId%>"> <input
					type="text" required disabled="disabled" value="<%=userId%>" id="userId">
				<input type="text" required name="first_name"
					placeholder="Enter First Name" value="<%=firstName%>"> <input type="text" required
					name="last_name" placeholder="Enter Last Name" value="<%=lastName%>"> <input
					type="email" required="required" name="email" value="<%=email%>"
					placeholder="Enter Email"> <select name="gender"
					id="gender"
					onchange="this.className=this.options[this.selectedIndex].className"
					required="required">
					<option value="<%=gender%>" selected="selected" hidden=""><%=gender%></option>
					<option value="male" class="optionColor">Male</option>
					<option value="female" class="optionColor">Female</option>
				</select>
				<textarea rows="1" cols="0" required="required"
					placeholder="Enter your Address" name="address"><%=address%></textarea>
				<input type="text" inputmode="numeric" name="mobile"
					pattern="[0-9]{10}" title="Enter Moible Number" maxlength="10"
					placeholder="Enter Mobile Number" required value="<%=mobile%>"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
				<button type="submit">Update</button>
			</form>
		</div>

		<div class="back">
			<a id="back_btn" href="userdetails.jsp">Go Back</a>
		</div>
	</div>




	<script type="text/javascript">
	setTimeout(() => {
		let get = document.getElementById('message');
		get.style.display = 'none';
		}, 6000);
	</script>

</body>
</html>
