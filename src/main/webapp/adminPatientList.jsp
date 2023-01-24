<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome | HMS</title>
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


.div_1, .div_2 {
    margin-top: 5%;
    margin-left: auto;
    margin-right: auto;
    width: 200px;
    box-shadow: 0px 0px 0px 1px gainsboro;
    border-radius: 30%;
    height: 200px;
    display: table;
    transition: 0.34s ease;
    cursor: pointer;
}

.div_1:hover , .div_2:hover{
    border: none;
    box-shadow: 0px 0px 10px 10px #a7ede8;
    border-radius: 100%;
}

.div_1 a, .div_2 a{
    display: block;
    text-align: center;
    text-decoration: none;
    color: black;
    font-size: 18px;
    padding: 100px 0px;
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
        <a href="adminAppointmentDetails.jsp">Appointment List</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>


<div class="div_1">
    <a href="adminViewPatients.jsp">
        All List
    </a>
</div>

<div class="div_2">
    <a href="adminPatientsDepartmentView.jsp">
        Department List
    </a>
</div>

</body>
</html>
    
    