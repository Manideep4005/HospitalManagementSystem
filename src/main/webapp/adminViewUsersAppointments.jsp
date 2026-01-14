<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@include file="adminSessionValidate.jsp" %> 
    <%
    
        Integer s = Integer.parseInt(request.getParameter("id"));
    
         String userFirstName = "";
         String userLastName = "";
         Integer id = 0;

        PreparedStatement  pstmt1 = MySqlConnection.getConnection().prepareStatement("select first_name,last_name,userid from user where userid = ?");
        pstmt1.setInt(1, s);
        
        ResultSet r = pstmt1.executeQuery();

        while (r.next()) {
           userFirstName =  r.getString("first_name");
           userLastName = r.getString("last_name");
        	id = r.getInt("userid");
        }
        
         

    
        PreparedStatement  pstmt = MySqlConnection.getConnection().prepareStatement("select * from appointment where user_id = ?");
        pstmt.setInt(1, s);
        
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
<title>History | Appointments User</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<style type="text/css">
body {
	margin: 0;
	background-color: white;
	font-family: 'Poppins', sans-serif;
}

* {
	box-sizing: border-box;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	border-bottom: 1px solid gainsboro;
	/*position: fixed;
    width: 100%;*/
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 10px 16px;
	text-decoration: none;
	font-weight: 700;
	transition: 0.1s ease;
	border-radius: 5px;
}

li a:hover, .dropdown:hover {
	background-color: lavender;;
	color: black;
}

li.dropdown {
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
}

.dropdown-content {
	background-color: white;
	border-radius: 8px;
	display: none;
	position: absolute;
	min-width: 160px;
	margin-left: -50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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

.dropdown-content a:hover {
	background-color: #0295A9;
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
	font-size: 16px;
	font-weight: 1000;
}

.dropbtn span:hover, .dropbtn span {
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
	font-size: 1.2em;
}

.nav {
	padding: 8px 2px 0px 2px;
}

#demo {
	color:red;
	text-align: center;
	margin: 0;
}

.nav .form {
	margin-left: auto;
	margin-right: auto;
	justify-items: center;
}

input {
	width: 60%;
	padding: 10px 30px;
	border-radius: 5px;
	border: 1px solid #008cba;
	transition-duration: 0.4s;
	outline: none;
	color: black;
	font-size: 15px;
	margin-left: 20px;
}

input:focus {
	box-shadow: 0 0 0 2px dodgerblue;
}

.nav button {
	border: none;
	display: inline-block;
	margin: 0;
	padding: 10px 15px;
	border-radius: 3px;
	width: 30%;
	border: 2px solid dodgerblue;
	background-color: white;
	font-size: 15px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.nav button:hover {
	border-color: transparent;
	background-color: #008cba;
	color: white;
}

.scroll {
	margin-top: 5%;
	overflow-y: auto;
	height: 500px;
}

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 3%;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 10px 10px;
	font-size: 16px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 10px 10px;
	font-size: 16px;
	border: 1px solid #ccc;
}

h3 {
	text-align: center;
	color: black;
	font-size: 18px;
	margin: 0;
}

@media screen and (max-width:600px) {
	.scroll {
		height: 450px;
	}
	td, th {
		font-size: 14px;
	}
	li a {
		padding: 10px 5px;
	}
	.dropdown-content {
		margin-left: -60px;
	}
	
	input {
		margin-left:10px;
	}
}

.get_details button {
	background-color: #168AAD;
	width: 100px;
	color: white;
	padding: 10px 16px;
	margin: 10px 0px;
	border: 2px solid transparent;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	cursor: pointer;
	transition-duration: .4s;
}

.get_details button:hover {
	border: 2px solid #168AAd;
	background-color: white;
	color:black;
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
        <a href="adminViewAdmins.jsp">Admins List</a>
        <a href="adminViewUsers.jsp">Users List</a>
        <a href="LogoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>



<div class="scroll">
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
        
         
          if (id == 0) {
        	  out.println("<h3>No user found with the id " + s + "</h3>");
          }
          else if (count == 0) {
            out.println("<h3>user " + s+" have no appointments found</h3>");
        }
        else {
            out.println("<h3>\"" + count + "\" appointments found by user " + s + "</h3>");
            out.println("<tr>");
            out.println("<th>Appointment Id</th>");
            out.println("<th>Patient Id</th>");
            out.println("<th>Patient First Name</th>");
            out.println("<th>Patient Last Name</th>");
            out.println("<th>Check-up</th>");
            out.println("<th>Appointment Date</th>");
            out.println("</tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("appointment_id") + "</td>");
            out.println("<td>" + rs.getString("patient_id") + "</td>");
            out.println("<td>" + rs.getString("patient_firstname") + "</td>");
            out.println("<td>" + rs.getString("patient_lastname") + "</td>");
            out.println("<td>" + rs.getString("checkup_type") + "</td>");
            out.println("<td>" + rs.getDate("appointment_date") + "</td>");
            out.println("</tr>");
            } 
        
        }
        
    
        %>
        
    </table>
</div>


        <div class="get_details">
        <form method="post" action="adminViewUsers.jsp">
            <button type="submit">Go Back</button>
        </form>
    </div>
    
    
   <!--  <%
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
     -->
    
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
        
        // function validate() {
              
        //       var y = document.getElementById("details").value;
              
        //       if ( isNaN(y)) {
        //         document.getElementById("demo1").innerHTML = "Enter Numbers Only.";
        //         return false;
        //       }
        //       else if ( y.length == "" || y.length < 5) {
        //           document.getElementById("demo1").innerHTML = "Please Enter 5 Digit \"User ID\"";
        //         return false;
        //       }
        //       else {
        //         return true;
        //       }
             
        //     }
    </script>

</body>
</html>
