<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    <% 
    	String type = request.getParameter("doctorview");
    
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from doctor where specialization=?");
    	pstmt.setString(1, type);
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	int count = 0;
    	
    	while (rs.next()) {
    		count++;
    	}
    	
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
    background-color: #FF5F6D;
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
    	padding: 3px;
    	font-family: 'Copperplate Gothic';
    	font-size: 15px;
    	border-radius: 5px;
    	background-color: #A8A8A8;
    }

    td {
    	border: none;
    	border-radius: 10px;
    	background-color: #EBF1F1;
    	padding: 5px;
    	font-family: 'Copperplate Gothic';
    	font-size: 15px;
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
	  font-size: 17px;
	  font-weight: 1000;
	  font-family: 'Copperplate Gothic';
	  padding-top: 13px;
	  
    }
    
    select:focus{
        border: 2px solid #317AC7;
    }

    select {
    	width: 50%;
          padding: 6px;
            margin: 8px 0;
          display: inline-block;
          border: 1px solid #667EEA;
          border-radius: 5px;
          box-sizing: border-box;
          outline: none;
          background-color: transparent;
          
          
          padding: 6px;
	  margin-top: 8px;
	  font-size: 17px;
	  width:120px;
    }

    select option{
        background: #0065a2;
        color: white;
        text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
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
	  padding: 10px;
	  
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
    <li><a href="adminmodule.jsp" >Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=session.getAttribute("adminName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("adminAccountId") %></a>
        <a href="admindetails.jsp">My Details</a>
        <a href="/HMS/AdminDisplayAllDoctors">Doctors list</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

	<div class="nav">
		<p>Search specific department</p>
		<div class="login-container">
			<form method="post" action="adminViewSpecificDoctor.jsp">
				<select required name="doctorview">
     
      <option value="general">General Physician</option>
      <option value="cardiologist">Cardiologist</option>
      <option value="dermetalogist">Dermatologist</option>
      <option value="orthopedic">Orthopedic</option>
      <option value="gastroenterologist">Gatroenterologist</option>
      <option value="diabetic">Diabetics</option>
      <option value="anesthesiologists">Anesthesiologists</option>
      <option value="neurologists">Neurologists</option>
      <option value="pediatric">Pediatric</option>
      <option value="pulmonologist">Pulmonologist</option>
      <option value="urologist">Urologist</option>
    </select> &nbsp;&nbsp;&nbsp;<button type="submit">view</button>
			</form>
		</div>
	</div>
	
	<div class="view_doctor">
	<table>
		<%
		if (count == 0) {
			
			out.println("<h1>"  + type + " currently unavailable</h1>");
			}
    	else {
    		out.println("<tr>");
			out.println("<th>Doctor Id</th>");
			out.println("<th>Doctor Name</th>");
			out.println("<th>Gender</th>");
			out.println("<th>Email</th>");
			out.println("<th>Education</th>");
			out.println("<th>Specialization</th>");
			out.println("<th>Experience (in years)</th>");
			out.println("<th>Address</th>");
			out.println("<th>Contact</th>");
			out.println("</tr>");
    		while (rs2.next()) {
    			out.println("<tr>");
    			out.println("<td>" + rs2.getInt("doctor_id") + "</td>");
    			out.println("<td>" + "Dr. " + rs2.getString("doctor_name") + "</td>");
    			out.println("<td>" + rs2.getString("gender") + "</td>");
    			out.println("<td>" + rs2.getString("email") + "</td>");
    			out.println("<td>" + rs2.getString("education") + "</td>");
    			out.println("<td>" + rs2.getString("specialization") + "</td>");
    			out.println("<td>" + rs2.getInt("experience") + "</td>");
    			out.println("<td>" + rs2.getString("address") + "</td>");
    			out.println("<td>" + rs2.getLong("contact") + "</td>");
    			out.println("</tr>");
    			
    		}
    	}
    	%>
	</table>
</div>
	
</body>
</html>