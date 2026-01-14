<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="userSessionValidate.jsp" %>
    <%@page errorPage="userError.jsp" %> 
    <% Integer id = (Integer)session.getAttribute("userAccountId"); 
       String userName = (String)session.getAttribute("currentUserName");
       
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Welcome</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      background-image: white;
    }

    .header {
      background-color: white;
      text-align: center;
      padding: 10px 0px;
      height: auto;
      margin-top: 0px;
      
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
    background-color: white;
	border-bottom: 1px solid gray;
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
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  margin-left: -40px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
  font-weight: 450;
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

.dropbtn span:hover{
  font-weight: 500;
  color: black;
}


.dropbtn span{
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
  font-size: 1.5em;
}
	


	label{
    	font-size: 20px;
        color: black;
        font-weight: 200;
        font-family: 'Copperplate Gothic';
    }

     input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid #808080;   
        box-sizing: border-box;
        outline: none;   
        border-radius: 5px;
        background-color: transparent;
        transition: 0.34s ease;
    }  

     input[type=password]:focus{
    	border: 2px solid #317AC7;
    }

    form {   
        border: 3px solid transparent;
        width: 500px;
        margin-left: auto;
        margin-right: auto;
        box-shadow: 0px 0px 0px 1px #808080;
        
        margin-top: 1%;
        padding: 20px;
    }   

    button {   
       	background-color: #168AAa;   
       	width: 100px;  
        color: white;   
        padding: 12px 10px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
		margin-right: auto;
		margin-left: auto;
		text-align: center;
		display: block;
		border-radius: 5px;
		cursor: pointer;
		transition:background-color 0.4s;
    }

    button:hover{
    	opacity: 0.8;
    }
    
    #demo {
    	margin: 0;
    	color:red;
    	font-weight: bold;
    	padding-left: 2%;
    }
    
    #demo1 {
    	font-weight: bold;
    	margin: 0;
    	color:green;
    	padding-left: 2%;
    }
    
    
    h3 {
    	color: red;
    	text-align: center;
    	font-weight: bolder;
    	font-family: 'Copperplate Gothic';
    }
</style>

<script type="text/javascript">
	function check() {
		var pass = document.getElementById('pass').value;
		var repass = document.getElementById('repass').value;

		if (pass.length == 0 || repass.length == 0) {
			document.getElementById('demo').innerHTML = '';
			return false;
		}
		else if (pass != repass) {
			document.getElementById('demo').innerHTML = 'Password doesn\'t match';
			document.getElementById('demo').style.color = 'red';
			return false;
		} else {
			document.getElementById('demo').innerHTML = 'Password matched';
			document.getElementById('demo').style.color = 'green';
			return true;
		}
	}
</script>

</head>
<body>
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
        <a href="#">My ID: <%=id %></a>
        <a href="userdetails.jsp">My Details</a>
        <a href="userAppointmentHistory.jsp">Appointment History</a>
        <a href="LogoutUserServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="header">
	<p>Change Password</p>
	<h3>Password can not be same as old one</h3>
</div>


<div class="change">
	<form action="ChangeUserPasswordServlet" method="post" onkeyup=" check()" >
		<label for="password">Enter new Password</label>
		<input type="password" name="newpassword" required id="pass">
		<label for="password">Re-Enter Password</label>
		<input type="password" name="newpassword1" required id="repass">
		<p id="demo"></p><p id="demo1"></p>
		<button type="submit">Reset</button>
	</form>
</div>
</body>
</body>
</html>
