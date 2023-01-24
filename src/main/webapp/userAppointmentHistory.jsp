<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% Integer id = (Integer)session.getAttribute("userAccountId"); 
       String userName = (String)session.getAttribute("currentUserName");
       
    %>
    
    <%
    	Integer userId = 0;
    
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from appointment where user_id = ?");
    	pstmt.setInt(1, id);
    	
    	ResultSet rs1 = pstmt.executeQuery();
    		
    	while (rs1.next()) {
    		userId = rs1.getInt("user_id");
    	}
    	
    	
    	
    	ResultSet rs2 = pstmt.executeQuery();
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment History | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      background-image: linear-gradient(to right, #FFFFFF, #F7F7F7);
    }

    .header {
      
      text-align: center;
      padding: 5px 0px;
      height: auto;
      margin-top: 0px;
    }

   

    .header p{
      margin: 0;
      font-weight: bolder;
      font-size: 18px;
      font-family: 'Copperplate Gothic';
      color: #34495E;
      text-decoration:underline; 
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #EBF1F1;
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
  font-weight: bold;
  transition: 0.1s ease;
  border-radius: 5px;
}

li a:hover, .dropdown:hover  {
  background-color: #BEC3C7;
  color: black;
  font-weight: 1000;
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
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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

.dropdown-content a:hover {background-color: #778899;}

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
  font-weight: 300;
}

.dropbtn span{
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
  padding: 18px 5px;
  color: white;
  height: 100%;
}

.button-icon {
  font-size: 1.5em;
}


    
    .column {
    	border:1px solid red;
    	height: auto;
    }

    @media screen and (max-width:800px) {
    	.history {
    		width: 50%;
    	}

    	table {
    		width: 50%;
    	}

    	
    }


    .history {
    	margin-top: 2%;
    }

    .patient_details p{
/*    	margin: 0;*/
    	font-family: 'Copperplate Gothic';
    	font-size: 20px;
    	font-weight: 500;
    	padding-left: 20px;
    }

    table {
    	width: 90%;
    	margin-left: auto;
    	margin-right: auto;
    	box-shadow: 0px 0px 10px 0px #60FD00;
    	border-radius: 5px;
    	padding: 5px 0px 5px 0px;
    	margin-top: 1%;
    }



    th{
    	padding: 10px 10px;
    	font-family: 'Copperplate Gothic';
    	font-size: 18px;
    	border-radius: 5px;
    	background-color: #A8A8A8;
    }

    td {
    	border: none;
    	border-radius: 10px;
    	background-color: #EBF1F1;
    	padding-left: 15px;
    	padding: 10px 10px;
    	font-family: 'Copperplate Gothic';
    	font-size: 18px;
    }

    h1 {
    	text-align: center;
    	font-family: 'Copperplate Gothic';
    	color: #60FD00;

    }
</style>
</head>


<body>
	<div class="topnav">
  	<ul>
    <li><a href="usermodule.jsp" >Home</a></li>
    <li><a href="usercontact.jsp">Contact Us</a></li>
    <li><a href="userabout.jsp">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=userName %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=id %></a>
        <a href="userdetails.jsp">My Details</a>
        <a href="userappointment.jsp">Book Appointment</a>
        <a href="/HMS/logoutUserServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="header">
	<p>Appointment History</p>
</div>


	<div class="view">
	<% 
		
	
	
    	
    %>
		
		
  	<table>
		<!--  <tr class="heading"><th>Appointment ID</th><th>Patient ID</th><th>Patient Name</th>
			<th>Check-up Type</th><th>Appointment Date</th></tr>-->
		<%
		if (userId == 0) {
			
			out.println("<h1>You haven't booked any Appointments</h1");
			}
    	else {
    		out.println("<tr>");
			out.println("<th>Appointment ID</th>");
			out.println("<th>Patient ID</th>");
			out.println("<th>Patient Name</th>");
			out.println("<th>checkup type</th>");
			out.println("<th>Appointment Date</th>");
			out.println("</tr>");
    		while (rs2.next()) {
    			out.println("<tr>");
    			out.println("<td>" + rs2.getInt("appointment_id") + "</td>");
    			out.println("<td>" + rs2.getInt("patient_id") + "</td>");
    			out.println("<td>" + rs2.getString("patient_name") + "</td>");
    			out.println("<td>" + rs2.getString("checkup_type") + "</td>");
    			out.println("<td>" + rs2.getDate("appointment_date") + "</td>");
    			out.println("</tr>");
    			
    		}
    	}
    	%>

	</table>
	</div>

	
	

</body>
</html>