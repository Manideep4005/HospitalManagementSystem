<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="com.hms.db.CurrentDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    
    <%
    
    	Date date = CurrentDate.getCurrnetDate();
    	//out.println(date);
    	
    	String specialization = (String)session.getAttribute("doctorSpecialization");
    	
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from appointment where appointment_date = ? and checkup_type=?");
    	pstmt.setDate(1, date);
   		pstmt.setString(2, specialization);
   		
   		int count = 0;
   		ResultSet rs1 = pstmt.executeQuery();
   		while (rs1.next()) {
   			count++;
   		}
   		
   		ResultSet rs = pstmt.executeQuery();
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments | HMS</title>
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
    background-color: #FF5F6D;
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
  height: 36.6px;
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

        margin-top: 1%;
        margin-left: auto;
        margin-right: auto;
        
    }



    th{
        padding: 8px 10px;
        font-family: 'Copperplate Gothic';
        font-size: 16px;
        border-radius: 5px;
        background-color: #A8A8A8;
    }

    td {
        border: none;
        border-radius: 10px;
        background-color: #EBF1F1;
        padding: 8px 10px;
        font-family: 'Copperplate Gothic';
        font-size: 16px;
    }
    
    h1 {
            text-align: center;
        font-family: 'Copperplate Gothic';
        color: #60FD00;

    }
    
    @media screen and (max-width:800px) {
    
      
    
    }
    
    .nav {
        overflow: hidden;
        background-color: #EA8D8D;
    }
    
    .nav .login-container {
        float:right;
    }
    
    .nav p {
      margin-top: 0;
      
      float: left;
      display: inline-block;
      color: black;
      text-align: center;
      padding: 0px 14px;
      text-decoration: none;
      font-size: 15px;
      font-weight: 1000;
      font-family: 'Copperplate Gothic';
      padding-top: 13px;
      
    }
    
    input[type=text]:focus{
        border: 1px solid darkred;
    }

    input[type=text] {
            margin: 8px 0;
          display: inline-block;
          border: 1px solid #667EEA;
          border-radius: 5px;
          box-sizing: border-box;
          outline: none;
          background-color: white;
          
          padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      width:120px;
    } 

    
    .login-container button {
            float: right;
      padding: 6px;
      margin-top: 8px;
      margin-right: 16px;
     background-image: linear-gradient(to left, #FF5F6D, #FFC371);
      color: black;
      font-size: 17px;
      border: none;
      cursor: pointer;
      transition: 0.4s ease;
      border-radius: 8px;
    }
    
    .login-container button:hover {
      background-image: linear-gradient(to right, #FF5F6D, #FFC371);
      color: black;
      box-shadow: 0px 0px 5px 0px red;
    }
    
    input::placeholder{
        font-weight: bold;
        opacity: 0.6;
        font-size: 12px;
    }
</style>
</head>
<body>
	<div class="topnav">
  <ul>
    <li><a href="doctormodule.jsp" >Home</a></li>
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
        <a href="/HMS/logoutDoctorServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

    <div class="nav">
        <p>Enter Patient Id For Complete Details</p>
        <div class="login-container">
            <form method="post" action="doctorViewPatientDetails.jsp">
                <input type="text" name="patientId" required maxlength="5" placeholder="Enter patient id">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>
    
    <div class="appintment_view">
        <table>
            <tr>
                <th>Appointment Id</th>
                <th>Patient Id</th>
                <th>Patient Name</th>
                <th>Check-up</th>
                <th>Appointment Date</th>
            </tr>
		
			<%
				if (count == 0) {
					out.println("<h1>No Appointments</h1>");
				}
				else 
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("appointment_id") + "</td>");
					out.println("<td>" + rs.getInt("patient_id") + "</td>");
					out.println("<td>" + rs.getString("patient_name") + "</td>");
					out.println("<td>" + rs.getString("checkup_type") + "</td>");
					out.println("<td>" + rs.getDate("appointment_date") + "</td>");
					out.println("</tr>");
				}
			
			%>
            
        </table>
    </div>
</body>
</html>