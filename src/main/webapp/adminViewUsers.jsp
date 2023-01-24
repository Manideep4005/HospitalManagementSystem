<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    <% 
    	Integer userId = (Integer)session.getAttribute("adminAccountId");
    	String adminName = (String)session.getAttribute("adminName");
    	
    	Statement stmt = MySqlConnection.getConnection().createStatement();
    	ResultSet rs = stmt.executeQuery("select * from user");
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
    
    <style type="text/css">
 body{
            margin: 0;
            background-image: linear-gradient(to right, #78A6c8, #5689C0);
        }

        * {
            box-sizing: border-box;
        }
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #0295A9;
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
/*  background-color: lavender;*/
background-image: linear-gradient(to right, #78A6c8, #5689C0);
  color: black;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
  font-weight: 500;
}

.dropdown-content {
     background-image: linear-gradient(to left, #78A6c8, #5689C0);
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

.dropdown-content a:hover {background-color: #0295A9;}

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
        padding: 5px 10px;
        font-family: 'Copperplate Gothic';
        font-size: 15px;
        border-radius: 5px;
/*        background-color: #A8A8A8;*/
        text-align: left;
    }

    td {
        border: none;
        border-radius: 10px;
/*        background-color: #EBF1F1;*/
        padding: 5px 10px;
        
        font-size: 15px;
        font-weight: 400;
        text-align: left;
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
        border: 2px solid darkblue;
    }

    input {
          margin: 6px 0;
          display: inline-block;
          border: 2px solid #999999;
          border-radius: 8px;
          box-sizing: border-box;
          outline: none;
          background-color: white;
          padding: 6px;
      font-size: 12px;
      width:120px;
      transition : .34s;
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
        <a href="/HMS/AdminDisplayAllDoctors">Doctors List</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="nav">
        <p>Search User Appointments</p> <span id="demo"></span>
        <div class="login-container">
            <form method="post" action="adminViewUsersAppointments.jsp" onsubmit="return validateForm()">
                <input type="text" name="userid"  maxlength="5" placeholder="User id..." id="one">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div>

<div class="user_view">
    <table>
        <tr>
            <th>User Id</th>
            <th>User Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Joined Date</th>
        </tr>

        
        
        <%
        	while (rs.next()) {
        		out.println("<tr>");
        		out.println("<td>" + rs.getInt("userid") + "</td>");
        		out.println("<td>" + rs.getString("username") + "</td>");
        		out.println("<td>" + rs.getString("password") + "</td>");
        		out.println("<td>" + rs.getString("email") + "</td>");
        		out.println("<td>" + rs.getString("gender") + "</td>");
        		out.println("<td>" + rs.getString("address") + "</td>");
        		out.println("<td>" + rs.getLong("contact") + "</td>");
        		out.println("<td>" + rs.getDate("join_date") + "</td>");
        		out.println("</tr>");
        	}
        %>
    </table>
</div>
	
	<script type="text/javascript">
	 function validateForm() {
         
         var y = document.getElementById("one").value;
         
         if ( isNaN(y)) {
           document.getElementById("demo").innerHTML = "Enter Numbers Only.";
           return false;
         }
         else if ( y.length == "" || y.length < 5) {
             document.getElementById("demo").innerHTML = "Please Enter 5 Digit Id";
           return false;
         }
         else {
           return true;
         }
        
       }
   
	</script>
	
</body>
</html>