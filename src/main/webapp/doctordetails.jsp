<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    
    <%
    	Integer id = (Integer)session.getAttribute("doctorAccountId");
    	
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
<title>Dr. <%=session.getAttribute("doctorAccountName") %> | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	
* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      background-color: #BFF098;
    }

    .header {
      
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
      text-decoration: underline;
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #93A5CF;
    /*position: fixed;
    width: 100%;*/
    border-bottom: 2px solid #00FFb8;
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
	table {
		margin-left: auto;
		margin-right: auto;
		box-shadow: 0px 6px 18px #01FFC3;
		border-radius: 10px;
		transition: 0.35s ease-in-out;
		
	}
	
	table:hover{
		
		box-shadow: 0px 6px 18px  #006FFF,
				0px 6px 18px #01FFC3;
		
	}
	
	th {
		text-align: left;
		font-size : 18px;
		padding: 5px 10px 5px 50px;
		
	}
	
	td {
		text-align: left;
		font-size: 19px;
		padding: 5px 50px 5px 20px;
	}
	
	.details {
		margin-left: auto;
		margin-right: auto;
		margin-top: 3%;
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
        <a href="/HMS/logoutDoctorServlet">Logout</a>
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

</body>
</html>