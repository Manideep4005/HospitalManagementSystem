<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String type = (String)session.getAttribute("specific");
  	   
    
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from doctor where specialization = ?");
    	pstmt.setString(1, type);
    	
    	int count = 0;
    	
    	ResultSet rs1 = pstmt.executeQuery();
    	
    	while (rs1.next()) {
    		count++;
    	}
    	
    	//out.println(count);
    	
    	ResultSet rs2 = pstmt.executeQuery();
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=type.toUpperCase() %> | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
 body{
            margin: 0;
            background-image: linear-gradient(to right, #FF5F6D, #FFC371);
        }

        * {
            box-sizing: border-box;
        }
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #EA8D8D;
    /*position: fixed;
    width: 100%;*/
}

li {
  float: left;
  
}

li a{
  display: inline-block;
  color: midnightblue;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-family: 'Copperplate Gothic';
  font-weight: 500;
  transition: 0.1s ease;
  border-radius: 5px;
}

li a:hover, .dropdown:hover  {
  background-color: lavender;
  color: black;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
  font-weight: 500;
}

.dropdown-content {
	 background-image: linear-gradient(to right, #FF5F6D, #FFC371);
  display: none;
  position: absolute;
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
  font-weight: 500;
  
}

.dropdown-content a:hover {background-color: lavendar;}

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
background-color: lavendar;
  font-weight: 500;
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
  font-size: 1.2em;
}

table {
    	width: 90%;
    	margin-left: auto;
    	margin-right: auto;
    	
    	border-radius: 2px;
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
      <span class="button-text"><%=session.getAttribute("currentUserName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("userAccountId") %></a>
        <a href="userdetails.jsp">My Details</a>
        <a href="userAppointmentHistory.jsp">Appointment History</a>
        <a href="/HMS/logoutUserServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="view_doctor">
	<table>
		<%
		if (count == 0) {
			
			out.println("<h1>"  + type + " currently unavailable</h1>");
			}
    	else {
    		out.println("<tr>");
			out.println("<th>Doctor Name</th>");
			out.println("<th>Gender</th>");
			out.println("<th>Education</th>");
			out.println("<th>Specialization</th>");
			out.println("<th>Experience (in years)</th>");
			out.println("</tr>");
    		while (rs2.next()) {
    			out.println("<tr>");
    			out.println("<td>" + "Dr. " + rs2.getString("doctor_name") + "</td>");
    			out.println("<td>" + rs2.getString("gender") + "</td>");
    			out.println("<td>" + rs2.getString("education") + "</td>");
    			out.println("<td>" + rs2.getString("specialization") + "</td>");
    			out.println("<td>" + rs2.getInt("experience") + "</td>");
    			out.println("</tr>");
    			
    		}
    	}
    	%>
	</table>
</div>
</body>
</html>