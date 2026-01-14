<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="doctorSessionValidate.jsp" %>
    <% 	String id = (String)request.getParameter("patientId");
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where patient_id=?");
    	pstmt.setString(1, id);
    	
    	
    	
    	ResultSet rs1 = pstmt.executeQuery();
    	
    	
    	
    	
    	int count = 0;
    	
    	
    	
    	int patientId = 0;
    	String patientFirstName = "";
    	String patientLastName = "";
    	String gender = "";
    	int age = 0;
    	String checkup_type = "";
    	String symptoms = "";
    	String email = "";
    	String address = "";
    	long contact = 0;
    	
    	
    	while (rs1.next()) {
    		count++;
    	}
    	
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	while (rs.next()) {
    		patientId = rs.getInt("patient_id");
    		patientFirstName = rs.getString("patient_firstname");
    		patientLastName = rs.getString("patient_lastname");
    		gender = rs.getString("gender");
    		age = rs.getInt("age");
    		checkup_type = rs.getString("checkup_type");
    		symptoms = rs.getString("symptoms");
    		email = rs.getString("email");
    		address = rs.getString("address");
    		contact = rs.getLong("contact");
    	}
    	
    	
    	
    	
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details | HMS</title>
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
	padding: 10px;
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
	font-weight: 600;
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
	margin-top: 3%;
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
	margin-top: 3%;
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
		padding: 10px;
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
    <li><a href="adminmodule.jsp" >Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=session.getAttribute("doctorAccountName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("doctorAccountId") %></a>
        <a href="doctordetails.jsp">My Details</a>
        
        <a href="LogoutDoctorServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="header">
    <p>Patient Details</p>
</div>


    <div class="scroll">
    <!--      <table>
            

        </table>-->
        
        
        <%
        	if (count == 0) {
        		out.println("<h1>Details not found</h1>");
        	} else {
        		out.println("<table>");
        		out.println("<tr>");
        		out.println("<th>Patinet Id:</th>");
        		out.println("<td>" +  patientId + "</td>");
        		out.println("</tr>");
        		
        		out.println("<tr>");
        		out.println("<th>First Name:</th>");
        		out.println("<td>" +  patientFirstName + "</td>");
        		out.println("</tr>");
        		
        		out.println("<tr>");
        		out.println("<th>Last Name:</th>");
        		out.println("<td>" +  patientLastName + "</td>");
        		out.println("</tr>");
        		
        		out.println("<tr>");
        		out.println("<th>Gender:</th>");
        		out.println("<td>" +  gender + "</td>");
        		out.println("</tr>");
        		
        		out.println("<tr>");
        		out.println("<th>Age:</th>");
        		out.println("<td>" +  age + "</td>");
        		out.println("</tr>");
        		
        		
        		out.println("<tr>");
        		out.println("<th>Check-Up:</th>");
        		out.println("<td>" +  checkup_type + "</td>");
        		out.println("</tr>");
        		
        		
        		out.println("<tr>");
        		out.println("<th>Symptoms:</th>");
        		out.println("<td>" + symptoms + "</td>");
        		out.println("</tr>");
        		
        		
        		out.println("<tr>");
        		out.println("<th>Email:</th>");
        		out.println("<td>" +  email + "</td>");
        		out.println("</tr>");
        		
        		
        		out.println("<tr>");
        		out.println("<th>Contact:</th>");
        		out.println("<td>" +  contact + "</td>");
        		out.println("</tr>");
        		
        		
        		out.println("<tr>");
        		out.println("<th>Address:</th>");
        		out.println("<td>" +  address + "</td>");
        		out.println("</tr>");
        		
        		
        		
        		
        		
        		out.println("</table>");
        	}
        
        %>
        
    </div>

    <div class="back">
       <form action="doctorViewAppointment.jsp" method="post">
       		<button>Go Back</button>
       </form>
    </div>
</body>
</html>
