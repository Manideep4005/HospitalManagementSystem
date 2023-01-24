<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    
   <% 
   
   		
   		
   		String userId = null;
   		
   		Cookie[] cookies = request.getCookies();
   		if (cookies != null) {
   			for (Cookie cookie : cookies) {
   				if (cookie.getName().equals("userId"))
   					userId = cookie.getValue();
   				
   			}
   		}
   		
   		if (userId == null)
   			response.sendRedirect("Userlogin.html");
   %>
  
  	
  <% 
  	// JDBC CODE TO GET USER NAME
  	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select username,userid from user where userid = ?");
  	pstmt.setString(1, userId);
  	
  	Integer uId = 0;
  	String userName = null;
  	
  	
  	
  	ResultSet rs = pstmt.executeQuery();
  	
  	while (rs.next()) {
  		uId = rs.getInt("userid");
  		userName = rs.getString("username");
  	}
  	
  	
  	session.setAttribute("userLogoutName", userName);
  	session.setAttribute("currentUserName", userName);
 	session.setAttribute("userAccountId", new Integer(uId));
  %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mani Hospitals | Welcome</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<link rel="stylesheet" type="text/css" href="CSS/dropdown.css">
<style type="text/css">
    * {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      background-image: linear-gradient(to right, #A1C4FD , #C2E9FB);
    }

    .header {
      background-color: #A1C4FD;
      text-align: center;
      padding: 10px 0px;
      height: auto;
      margin: 0px;
    }

   

    .header p{
      margin: 0;
      font-weight: 1000;
      font-size: 20px;
      font-family: 'Copperplate Gothic';
      color: white;
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #537895 ;
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
  transition: 0.4s ease;
}

li a:hover, .dropdown:hover  {
  background-color: white;
  color: black;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
  font-weight: 500;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #667EEA;
  min-width: 160px;
  margin-left: -2px;
  box-shadow: 0px 8px 16px 0px #09203F;
  z-index: 1;
  border-radius: 10px;
  
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
  font-weight: bold;
  transition: 0.1s ;
  font-size: 14px;
}

.dropdown-content a:hover { background-image: linear-gradient(to right, #A1C4FD , #C2E9FB);
}

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

    @media screen and (max-width:800px) {
      .book {
        margin-top: 100%;
      }
    }

    

   .intro {
        padding: 10px;
        margin-top: 1%;
        padding-left: 15px;
        margin-left: 1%;
        margin-right: 1%;
        border-radius: 2%;
        box-shadow: 0px 0px 5px 0px #537895;
   }

   .intro p {
    color: black;
    font-weight: 500;
    font-family: 'Copperplate Gothic';
    font-size: 20px;
   }

   select:focus{
        border: 2px solid #317AC7;
        box-shadow: none;
    }

    select {
        width: 50%;
          padding: 12px 20px;
            margin: 8px 0;
          display: inline-block;
          border: 2px solid transparent;
          box-shadow: 0px 0px 5px 0px midnightblue;
          border-radius: 5px;
          box-sizing: border-box;
          outline: none;
          background-color: transparent;
          transition: 0.34s ease;
    }

    select option{
        background: #0065a2;
        color: white;
        text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
    }


    .doctor_view, .book {
        box-shadow: 0px 0px 5px 0px #09203F;
        margin-top: 5%;
        margin-left: auto;
        margin-right: auto;
        padding: 15px 20px;
        border-radius: 2%;
        width: 500px;
        text-align: center;
        transition: 0.34s ease;
    }

    .doctor_view:hover, .book:hover {
        border-radius:10pc 2%;
    }
        
    .doctor_view p {
        font-weight: 500;
        font-size: 20px;
        font-family: 'Copperplate Gothic';

    }


        .book p{
            font-size: 20px;
            font-family: 'Copperplate Gothic';
            font-weight: 500;

        }

        .book button {
            border: none;
            background-color: #a8a8a8;
            color: black;
            padding: 10px 15px;
            border-radius: 20px;
            width: 150px;
            cursor: pointer;
            transition: 0.34s ease;
        }

        .book button:hover {
            width:200px;
            background-color: #537895;
            color: white;
        }

        .doctor_view button {
            border: none;
            background-color: #a8a8a8;
            color: black;
            padding: 8px 10px;
            border-radius: 20px;
            width: 80px;
            cursor: pointer;
            transition:  0.34s ease;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5px;
        }

    .doctor_view button:hover {
             width:120px;
            background-color: #537895;
            color: white;
        }
</style>
</head>
<body>
    <div class="header">
  <p>Welcome User</p>
</div>

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
        <a href="#">My ID: <%=userId %></a>
        <a href="userdetails.jsp">My Details</a>
        <a href="userAppointmentHistory.jsp">Appointment History</a>
        <a href="/HMS/logoutUserServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>
    
        
<div class="doctor_view">
    <p>Find A Doctor</p>
    <form method="post" action="UserViewDoctorServlet">
        <select required name="doctorview">
      <option value="all">All</option>
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
    </select> &nbsp;&nbsp;&nbsp;<span><button type="submit">View</button></span>
    
    </form> 
</div>

<div class="book">
    <p>Consult A Doctor</p>
    <form action="userappointment.jsp" method="post">
        <button type="submit" >Book Appointment</button>
    </form>
</div>
    
</body>
</html>