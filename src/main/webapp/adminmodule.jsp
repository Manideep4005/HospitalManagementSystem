<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    
    <%@ page errorPage="adminError.jsp" %>
    
   <% 
   
   		
   		
   		String userId = null;
   		
   		Cookie[] cookies = request.getCookies();
   		if (cookies != null) {
   			for (Cookie cookie : cookies) {
   				if (cookie.getName().equals("adminId"))
   					userId = cookie.getValue();
   				
   			}
   		}
   		
   		if (userId == null)
   			response.sendRedirect("Adminlogin.html");
   %>
  
  	
  <% 
  	// JDBC CODE TO GET USER NAME
  	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select admin_name,admin_id from admin where admin_id = ?");
  	pstmt.setString(1, userId);
  	
  	Integer aId = 0;
  	String adminName = null;
  	
  	
  	
  	ResultSet rs = pstmt.executeQuery();
  	
  	while (rs.next()) {
  		aId = rs.getInt("admin_id");
  		adminName = rs.getString("admin_name");
  	}
  	
  	
  	session.setAttribute("adminLogoutName", adminName);
 	session.setAttribute("adminAccountId", new Integer(aId));
 	session.setAttribute("adminName", adminName);
  %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome | <%=adminName %></title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<link rel="stylesheet" type="text/css" href="CSS/dropdown.css">
<style type="text/css">
	* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      /*background-image: linear-gradient(to right, #eacda3 , #d6ae7b);*/
      background-color: white;
    }


    .header {
      background-color: #D7BA89;
      text-align: center;
      padding: 5px 0px;
      height: auto;
      margin-top: 0px;
    }

   

    .header p{
      margin: 0;
      font-weight: 1000;
      font-size: 20px;
      font-family: 'Copperplate Gothic';
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
/*    background-color: #778899;*/
	background-image: linear-gradient(to left, #eacda3 , #d6ae7b);
    /*position: fixed;
    width: 100%;*/
}

li {
  float: left;
  
}

li a{
  display: inline-block;
  color: black;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-family: 'Copperplate Gothic';
  font-weight: 300;
  transition: 0.1s ease;
  border-radius: 5px;
  font-weight: 1000;
}

li a:hover, .dropdown:hover  {
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
  background-color: #D7BA89;
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
}

.dropdown-content a:hover {background-color: #eba46e;}

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
  font-family: 'Copperplate Gothic';
  font-size: 16px;
  font-weight: 1000;
}

.dropbtn span:hover, .dropbtn span{
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


    
    .inner_main1:after, .inner_main2:after, .inner_main3:after {
      content: "";
      display: table;
      clear: both;
    }

    @media screen and (max-width:800px) {
      
    }

    .inner_main1, .inner_main2, .inner_main3, .inner_main4 {
    	float: left;
    	margin-left: 12.8%;
    	margin-right: auto;
   		box-shadow: 0px 5px 8px 6px #eba46e;
   		padding: 10px 15px;
   		margin-top: 2%;
   		width: 30%;
   		border-radius: 2%;
   		transition: 0.35s ease-in;
    }

    .inner_main1:hover, .inner_main2:hover, .inner_main3:hover, .inner_main4:hover{
    	box-shadow: 0px 5px 8px 2px #d28d3d;
    	border-radius: 2% 5pc;
    }

    .inner_main1 p, .inner_main2 p, .inner_main3 p {
    	font-size: 20px;
    	text-align: center;
    	color: #6c451c;
    	font-weight: bold;
    }

    .inner_main1 button, .inner_main2 button, .inner_main3 button, .inner_main4 button{
    	margin-left: auto;
    	margin-right: auto;
    	display: block;
    	background-color: #cd9d6f;
    	border:none;
    	border-radius: 40px;
    	padding: 10px 12px;
    	font-weight: bold;
    	color: #745c34;
    	transition: 0.35s ease;
    	width: 90px;
    }

    .inner_main1 button:hover, .inner_main2 button:hover, .inner_main3 button:hover, .inner_main4 button:hover {
    	width: 120px;
    	border-radius: 100px;
    	opacity: 0.9;
    }

    
</style>
</head>
<body>
	<div class="header">
  <p>Welcome Admin</p>
</div>

<div class="topnav">
  <ul>
    <li><a href="adminmodule.jsp">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=adminName %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=userId %></a>
        <a href="admindetails.jsp">My Account</a>
        
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>
	
<div class="main_1">
	<div class="inner_main1">
		<p>Doctors List</p>
		<form action="/HMS/AdminDisplayAllDoctors" method="post">
			<button type="submit">click here</button>
		</form>
	</div>

	<div class="inner_main1">
		<p>Admins & Users</p>
		<form action="adminAdministration.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>
</div>
		
<div class="main_2">
	<div class="inner_main2">
		<p>Patients List</p>
		<form action="adminPatientList.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>

	<div class="inner_main2">
		<p>Appointments</p>
		<form action="adminAppointmentDetails.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>
</div>	
	
<div class="main_3">
	<div class="inner_main2">
		<p>Register Doctor</p>
		<form action="doctorregister.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>

	<div class="inner_main2">
		<p>Delete Doctor</p>
		<form action="adminDeleteDoctor.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>
</div>

<div class="main_4">
	<div class="inner_main2">
		<p>Search Patient</p>
		<form action="adminSearchPatient.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>

	<div class="inner_main2">
		<p>Patient Details</p>
		<form action="adminGetPatient.jsp" method="post">
			<button type="submit">click here</button>
		</form>
	</div>
</div>

</body>
</html>