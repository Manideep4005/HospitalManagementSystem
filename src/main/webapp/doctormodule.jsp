<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

    
    <% 
		String doctorId = null;
   		
   		Cookie[] cookies = request.getCookies();
   		if (cookies != null) {
   			for (Cookie cookie : cookies) {
   				if (cookie.getName().equals("doctorId"))
   					doctorId = cookie.getValue();
   				
   			}
   		}
   		
   		if (doctorId == null)
   			response.sendRedirect("Doctorlogin.html");
   %>
  
  	
  <% 
  	// JDBC CODE TO GET USER NAME
  	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select doctor_name,doctor_id,specialization from doctor where doctor_id = ?");
  	pstmt.setString(1, doctorId);
  	
  	Integer dId = 0;
  	String doctorName = "";
  	String specialization = "";
  	
  	
  	ResultSet rs = pstmt.executeQuery();
  	
  	while (rs.next()) {
  		dId = rs.getInt("doctor_id");
  		doctorName = rs.getString("doctor_name");
  		specialization = rs.getString("specialization");
  	}
  	
  	
  	session.setAttribute("doctorLogoutName", doctorName);
  	session.setAttribute("doctorAccountName", doctorName);
 	session.setAttribute("doctorAccountId", new Integer(dId));
 	session.setAttribute("doctorSpecialization", specialization);
  %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome | Hospital Management System</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<link rel="stylesheet" type="text/css" href="CSS/dropdown.css">
<style type="text/css">
    @charset "ISO-8859-1";

* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      background-image: linear-gradient(to right, #00b09b, #96c93d);
    }

    .header {
      background-color: #59C173;
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
    background-color: #38ef7d   ;
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
  font-weight: bold;
}

li a:hover, .dropdown:hover  {
  background-color: #a8ff78;
  color: black;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #59C173;
  min-width: 160px;
  margin-left: -30px;
  
  box-shadow: 0px 8px 16px 0px #00b09b;
  transition: 0.34s ease;
  border-radius: 10px;
  z-index: 1;
  text-align: center;
}

.dropdown-content:hover {
    box-shadow: 0px 2px 5px 0px #00b09b;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  
  font-weight: 300;
  transition: 0.34s ease;
  text-align: center;
}

.dropdown-content a:hover {background-color: #a8ff78;}

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

.dropbtn span:hover, .dropbtn span{
  font-weight: bold;
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

 
    

    @media screen and (max-width:600px) {
      .column {
        width: 100% ;
      }
    }

   .doctor_view p {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    font-family: 'Copperplate Gothic';
    color: white;
   }

   form {
    box-shadow: 0px 0px 5px 0.5px gainsboro;
    width: 500px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 5%;
    padding: 15px 10px;
    border-radius: 50px;
    height: 150px;
    transition: 0.34s ease;
   }

   form:hover {
    border-radius: 5% 5pc;
    width: 250px;
    height: 300px;
    padding-top: 5%;
   }



   button {
    display: block;
    margin-left: auto;
    margin-right: auto;
    border: none;
    padding: 8px 10px;
    width: 80px;
    cursor: pointer;
    transition: 0.34s ease;
    border-radius: 5px;
    font-size: 15px;
    background-color: #38ef7d;
   }

   button:hover {
    background-color: #a8ff78;
    width: 120px;
    border-radius: 50px;
   }
</style>
</head>
<body>
    <div class="header">
  <p>Welcome Doctor</p>
</div>

<div class="topnav">
  <ul>
    <li><a href="doctormodule.jsp">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text">Dr. <%=doctorName %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=doctorId %></a>
        <a href="doctordetails.jsp">My Account</a>
        
        <a href="/HMS/logoutDoctorServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>
    

    <div class="doctor_view">
        
        <form action="doctorViewAppointment.jsp" method="post">
            <p>Appointments</p>
            <button type="submit">view</button>
        </form>
    </div>
        
        
</body>
</html>