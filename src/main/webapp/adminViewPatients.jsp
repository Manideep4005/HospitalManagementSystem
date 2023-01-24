<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

	<% 
		Integer userId = (Integer)session.getAttribute("adminAccountId");
		String adminName = (String)session.getAttribute("adminName");
		
		Statement stmt = MySqlConnection.getConnection().createStatement();
		ResultSet rs = stmt.executeQuery("select * from patient");
		
		
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Patients</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
	* {
      box-sizing: border-box;
      
    }
    body {
      margin: 0;
      background-color: white;
    }

    

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #a8a8a8;
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
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
  font-weight: 300;
}

.dropdown-content a:hover {background-color: #778899;}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropbtn {
  display: inline-flex;
  height: 38px;
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


    .column{
      float: left;
/*      width: 33.33%;*/
      padding: 0px 15px 0px 15px;
      border: 1px solid red;
    }

    .column.side {
      width: 25%;

    }

    .column.middle {
      width: 50%;
    }

    .row:after{
      content: "";
      display: table;
      clear: both;
    }

    @media screen and (max-width:600px) {
      .column {
        width: 100% ;
      }
    }
	
	table {
        margin-left: auto;
        margin-right: auto;
        margin-top: 1%;
    }
    
    th {
        text-align: left;
        padding: 1.5px 5px;
        border-radius: 10px;
        font-family: 'Copperplate Gothic';
        font-size: 15px;
    }
    
    td {
        text-align: left;
        padding: 1.5px 6px;
        border-radius: 0.5px;
        font-size: 15px;
    }
	
	
	.nav {
        overflow: hidden;
        background-color: #f1f1f1;
        border-bottom:1px solid #808080;
    }
    
    .nav .login-container {
        float:right;
    }
    input::placeholder{
        font-weight: bold;
        opacity: 0.6;
        font-size: 12px;
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
      padding-top: 15px;
      
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
      padding: 8px 0px;
      margin-top: 8px;
      margin-right: 16px;
      background-color: #a8a8a8;
      color: black;
      font-size: 17px;
      border: none;
      cursor: pointer;
      transition: 0.34s ease;
      border-radius: 8px;
      width: 50px
    }
    
    .login-container button:hover {
     width: 80px;
      background-color: black;
      color:white;
    }
   
</style>
</head>
<body>
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
        <a href="adminAppointmentDetails.jsp">Appointment Details</a>
        <a href="adminPatientsDepartmentView.jsp">Patient Department wise</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>
	<div class="nav">
        <p>Enter Patient Id For Complete Details</p>
        <div class="login-container">
            <form method="post" action="adminViewPatientDetails.jsp">
                <input type="text" name="patientId" required maxlength="5" placeholder="Enter patient id">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>

<div class="patient_view">
	<table>
		<tr>
			<th>Patient Id</th>
			<th>Patient Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Check-up</th>
			<th>Symptoms</th>
			<th>Email</th>
			<th>Address</th>
			<th>Contact</th>
			<th>Appointment date</th>
			<th>User Id</th>
			
		</tr>
		
		<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getInt("patient_id") + "</td>");
				out.println("<td>" + rs.getString("patient_name") + "</td>");
				out.println("<td>" + rs.getString("gender") + "</td>");
				out.println("<td>" + rs.getInt("age") + "</td>");
				out.println("<td>" + rs.getString("checkup_type") + "</td>");
				out.println("<td>" + rs.getString("symptoms") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("address") + "</td>");
				out.println("<td>" + rs.getLong("contact") + "</td>");
				out.println("<td>" + rs.getTimestamp("admitted_date") + "</td>");
				out.println("<td>" + rs.getInt("user_id") + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
</div>

</body>
</html>