<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@include file="doctorSessionValidate.jsp" %>
    
    
    <%
    	Integer id = (Integer)session.getAttribute("doctorSessionId");
    	
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from doctor where doctor_id=?");
    	pstmt.setInt(1, id);
    	
    	String gender = "";
    	String email = "";
    	String education = "";
    	String specialization = "";
    	int experience = 0;
    	String address = "";
    	long contact = 0;
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	while (rs.next()) {
    		gender = rs.getString("gender");
    		email = rs.getString("email");
    		education = rs.getString("education");
    		specialization = rs.getString("specialization");
    		experience = rs.getInt("experience");
    		address = rs.getString("address");
    		contact = rs.getLong("contact");
    	}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Profile | HMS</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
}

body {
	background-color: #fffff7;
}

.header {
	text-align: center;
	padding: 5px 0px;
	height: auto;
	margin-top: 10px;
}

.header p {
	margin: 0;
	font-weight: 600;
	font-size: 20px;
	font-family: 'Poppins', sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 10px ;
	overflow: hidden;
	box-shadow: 0 2px 8px #C9C9BC;
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
	font-weight: 300;
	transition: 0.5s ease;
	font-weight: bolder;
	font-family: 'Poppins', sans-serif;
}

li a:hover, .dropdown:hover {
	background-color: #C9C9BC;
	color: white;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #C9C9BC;
	min-width: 160px;
	margin-left: -21px;
	box-shadow: 0 1px 5px black;
	transition: 0.34s ease;
	border-radius: 1px;
	z-index: 1;
	text-align: left;
}

.dropdown-content:hover {
	
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 600;
	transition: 0.34s ease;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #fffff7;
	color: black;
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
	font-weight: 600;
}

.dropbtn span:hover, .dropbtn span {
	font-weight: bolder;
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
}

.button-icon {
	font-size: 1.5em;
}

 

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 2%;
	border-spacing: 0;
	border-collapse: collapse;
	width: 500px;
	box-shadow: 0 0 15px #445454;
}

th,td {
	padding: 8px 20px;
	font-size: 18px;
	background-color: #fffff7;
	border: 1px solid #ccc;
	text-align: left;
}

td {
	 
	background-color: #fffff9;
}

h1 {
	text-align: center;
	color: red;
	margin-top: 10px;
}

.back form {
	
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 2%;
}

.back button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	background-color: #445454;
	opacity: 0.8;
	border:none;
	padding: 12px 18px;
	color:white;
	font-size: 18px;
	font-weight:bolder;
	cursor: pointer;
	transition: .4s;
	width: 80%;
}

.back button:hover {
	opacity: 1;
}

@media screen and (max-width:729px) {
	li a {
		padding: 10px 5px;
	}
	.button-icon {
		font-size: 1em;
	}
	.button-text, .button-icon {
		padding: 5px;
		height: 100%;
	}
	.dropdown-content {
		min-width: 100px;
		margin-left: -25px;
	}
	 
	table {
		width: 300px;
	}
	th, td {
		padding: 8px 20px;
		font-size: 14px;
	}
}
</style>
</head>
<body>
	<div class="topnav">
  <ul>
    <li><a href="doctormodule.jsp">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text">Dr. <%=session.getAttribute("doctorAccountName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("doctorAccountId") %></a>
        <a href="doctorViewAppointment.jsp">Appointments</a>
        <a href="LogoutDoctorServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>
	
	<div class="header">
  <p>My Account</p>
</div>

	
<div class="details">
	<table>
		<tr>
                <th>Doctor Id:</th>
                <td><%=id %></td>
            </tr>
            <tr>
                <th>Doctor Name:</th>
				<td><%=session.getAttribute("doctorAccountName") %></td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td><%=gender %></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><%=email %></td>
            </tr>
            <tr>
                <th>Education:</th>
                <td><%=education %></td>
            </tr>
            <tr>
                <th>Specialization:</th>
                <td><%=specialization %></td>
            </tr>
            <tr>
                <th>Experience:</th>
                <td><%=experience %></td>
            </tr>
            <tr>
                <th>Address:</th>
                <td><%=address %></td>
            </tr>
            <tr>
                <th>Contact:</th>
                <td><%=contact %></td>
            </tr>
	</table>
</div>

<div class="back">
       <form action="doctormodule.jsp" method="post">
       		<button>Home</button>
       </form>
    </div>


<div class="back">
       <form action="LogoutDoctorServlet" method="get">
       		<button>Log out</button>
       </form>
    </div>


</body>
</html>
