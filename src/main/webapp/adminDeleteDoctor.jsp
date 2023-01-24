<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <% 
    	
    
    	Statement stmt = MySqlConnection.getConnection().createStatement();
    	
    	
    	ResultSet rs = stmt.executeQuery("select * from doctor");
    	
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Doctor | HMS</title>
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
    
    table {
    	margin-top: 1%;
    	margin-left: auto;
    	margin-right: auto;
    }
    
    th {
    	padding: 3px 5px;
    	text-align: left;
    	font-family: 'Copperplate Gothic';
    	font-size: 15px;'
    }
    
     td {
     	font-size: 15px;
    	padding: 3px 6.5px;
    	text-align: left;
    	
    }
</style>

<script type="text/javascript">
	function message() {
		
		var x = document.getElementById('doctorid').value;
		
		alert('sucessfully deleted doctor with id' + x);
	}
</script>

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
        <a href="adminViewPatients.jsp">Patient List</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

    <div class="nav">
        <p>Enter Doctor Id To Delete</p>
        <div class="login-container">
            <form method="post" action="adminDoctorDeleteProcess.jsp" >
                <input type="text" name="doctorId" required maxlength="5" placeholder="Enter Doctor id" id="doctorid">&nbsp;&nbsp;
                 <button type="submit">Delete</button>
            </form>
        </div>
    </div>
    
    <table>
	<tr>
		<th>Doctor Id</th>
		<th>Doctor Name</th>
		<th>Gender</th>
		<th>Email</th>
		<th>Education</th>
		<th>Specialization</th>
		<th>Experience (in Years)</th>
		<th>Address</th>
		<th>Contact</th>
	</tr>
		<%
			
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getInt("doctor_id") + "</td>");
			out.println("<td>" + "Dr. " + rs.getString("doctor_name") + "</td>");
			out.println("<td>" + rs.getString("gender") + "</td>");
			out.println("<td>" + rs.getString("email") + "</td>");
			out.println("<td>" + rs.getString("education") + "</td>");
			out.println("<td>" + rs.getString("specialization") + "</td>");
			out.println("<td>" + rs.getInt("experience") + "</td>");
			out.println("<td>" + rs.getString("address") + "</td>");
			out.println("<td>" + rs.getLong("contact") + "</td>");
			out.println("</tr>");
			
		}
	    	
    	%>
	</table>
</body>
</html>