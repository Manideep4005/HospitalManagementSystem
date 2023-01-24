<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    <%
    
     Long s = Long.parseLong(request.getParameter("mobilenumber"));
    
    
    	PreparedStatement  pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where contact = ?");
    	pstmt.setLong(1, s);
    	
    	ResultSet rs1 = pstmt.executeQuery();
    	
    	int count = 0;
    	
    	while (rs1.next()) {
    		count++;
    	}
    	
    	ResultSet rs = pstmt.executeQuery();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient View | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
    
    * {
        box-sizing: border-box;
    }
    
    body {
        margin: 0;
    
    }
    
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: transparent;
    border-bottom: 1px solid gainsboro;
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
  transition: 0.34s ease;
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
  transition: 0.34s ease;
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
        background-color: transparent;
        border-bottom: 1px solid gray;
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
      padding: 8px 0px 0px 10px;
      text-decoration: none;
      font-size: 15px;
      font-weight: 1000;
      font-family: 'Copperplate Gothic';
      
    }
    
    #demo {
    	  margin-top: 0;
      float: left;
      display: inline-block;
      color: red;
      text-align: center;
      padding: 8px 0px 0px 10px;
      text-decoration: none;
      font-size: 15px;
      font-weight: 1000;
      font-family: 'Copperplate Gothic';
      margin-left: 55%
    }
    
    input:focus{
        border: 1px solid darkblue;
    }

    input {
          margin: 6px 0;
          display: inline-block;
          border: 1px solid #999999;
          border-radius: 8px;
          box-sizing: border-box;
          outline: none;
          background-color: white;
          padding: 6px;
      font-size: 12px;
      width:120px;
    } 

    
    .login-container button {
      float: right;
      padding: 6px;
      margin: 7.5px 0;
      margin-right: 16px;
      background-color: #a8a8a8;
      color: black;
      font-size: 12px;
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
    
    h1 {
        text-align: center;
        font-family: 'Copperplate Gothic';
    }
    
    
    label {
    font-size: 20px;
        color: midnightblue;
        font-weight: 200;
        font-family: 'Copperplate Gothic';
}

#details {
    width: 100%;   
    margin: 8px 0;  
    padding: 12px 20px;   
    display: inline-block;   
    border: 1px solid #808080;   
    box-sizing: border-box;
    outline: none;   
    border-radius: 5px;
    font-size: 18px;
    color: #808080;
    }  


    .get_details form {
     width: 500px;
        box-shadow: 0px 0px 0px 1px gainsboro;
        border-radius: 1%;
        margin-right: auto;
        margin-left: auto;
        padding: 5px;
        margin-top: 1%;
}

    .get_details button {
   background-color: #168AAD;   
        width: 100%;  
        color: white;   
        padding: 12px 20px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
        margin-right: auto;
        margin-left: auto;
        text-align: center;
        display: block;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: 0.34s ease;
}

    .get_details button:hover {
    opacity: 0.8;
}

	#demo1 {
 	font-size: 15px;
    margin-top: 0px;
    padding-left: 10px;
    color: red;
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
      <span class="button-text"><%=session.getAttribute("adminName") %></span>
      </a>


      <div class="dropdown-content">
        <a href="#">My ID: <%=session.getAttribute("adminAccountId") %></a>
        <a href="admindetails.jsp">My Account</a>
        <a href="adminViewPatients.jsp">Patients List</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>



<div class="nav">
        <p>Search Patients</p> <span id="demo"></span>
        <div class="login-container">
            <form method="post" action="adminSearchPatientDetails.jsp" onsubmit="return validateForm()">
                <input type="text" name="mobilenumber"  maxlength="10" placeholder="Contct..." id="one">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>

<div class="patient_view">
    <table>
      <!--    <tr>
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
            
        </tr>-->
        
        <% 
        
        if (s == 0) {
            out.println("<h1>Search Above</h1>");
        }
        
        else if (count == 0) {
            out.println("<h1>Patients not found  (" + s + ")</h1>");
        }
        else {
            
            out.println("<tr>");
            out.println("<th>Patient Id</th>");
            out.println("<th>Patient Name</th>");
            out.println("<th>Gender</th>");
            out.println("<th>Age</th>");
            out.println("<th>check-up</th>");
            out.println("<th>Symptoms</th>");
            out.println("<th>Email</th>");
            out.println("<th>Address</th>");
            out.println("<th>Contact</th>");
            out.println("<th>Appointment date</th>");
            out.println("<th>User Id</th>");
            out.println("</tr>");
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
        
        }
        
    
        %>
        
    </table>
</div>


	<!--    <div class="get_details">
        <form method="post" action="adminSearchPatientDetails2.jsp" onsubmit="return validate()">
            <label>Patient Id</label>
            <input type="text" name="patientid" maxlength="5" placeholder="Enter patient id..." id="details">
            <button type="submit">get details</button>
        </form>
    </div>-->
    
    
    <%
    	if(s != 0 && count != 0) {
    		out.println( " <div class=\"get_details\">");
    		out.println("<form method=\"post\" action=\"adminSearchPatientDetails2.jsp\" onsubmit=\"return validate()\">");
    		out.println("<label>Patient Id</label>");
    		out.println(" <input type=\"text\" name=\"patientid\" maxlength=\"5\" placeholder=\"Enter patient id...\" id=\"details\">");
    		out.println("<p id=\"demo1\"></p>");
    		out.println(" <button type=\"submit\">get details</button>");
    		out.println(" </form>");
    		out.println("</div>");
    	}
    %>
    
    
	<script type="text/javascript">
		
		
		
		function validateForm() {
	          
	          var y = document.getElementById("one").value;
	          
	          if ( isNaN(y)) {
	            document.getElementById("demo").innerHTML = "Enter Numbers Only.";
	            return false;
	          }
	          else if ( y.length == "" || y.length < 10) {
	        	  document.getElementById("demo").innerHTML = "Please Enter 10 Digits Number";
	            return false;
	          }
	          else {
	            return true;
	          }
	         
	        }
		
		function validate() {
	          
	          var y = document.getElementById("details").value;
	          
	          if ( isNaN(y)) {
	            document.getElementById("demo1").innerHTML = "Enter Numbers Only.";
	            return false;
	          }
	          else if ( y.length == "" || y.length < 5) {
	        	  document.getElementById("demo1").innerHTML = "Please Enter 5 Digit \"Patient ID\"";
	            return false;
	          }
	          else {
	            return true;
	          }
	         
	        }
	</script>

</body>
</html>