<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	body {
		margin: 0;
/*        background-color: #734f96	;*/
		background-image: linear-gradient(to right, #9896f0, #fbc8d5);
	}
	

    

    label{
    	font-size: 20px;
        color: midnightblue;
        font-weight: 200;
        font-family: 'Copperplate Gothic';
    }

    input[type=text], input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid #808080;   
        box-sizing: border-box;
        outline: none;   
        border-radius: 5px;
    }  

     input[type=password]:focus{
    	border: 2px solid #317AC7;
    }
    input[type=text]:focus{
    	border: 2px solid #317AC7;
    }

    form {   
        border: 3px solid transparent;
        width: 500px;
        margin-left: 2%;
        box-shadow: 0px 0px 20px 0px #808080;
        border-radius: 5%;
    }   

    button {   
       	background-color: #168AAD;   
       	width: 100px;  
        color: white;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
		margin-right: auto;
		margin-left: auto;
		text-align: center;
		display: block;
		border-radius: 5px;
		cursor: pointer;
		transition-duration: 0.4s;
    }

    button:hover{
    	background-color: #34a0a4;
    }

    .leftdiv{
    	width: 50%;
    	height: 70vh;
/*    	position: fixed;*/
    	border-top-right-radius: 50%;
    	border-bottom-right-radius: 50%;
/*    	background-color: #8a00c2;*/
        float: left;
        box-shadow: 10px 0px 0px 0px #808080;
        margin-top: 4%;
        background-image: linear-gradient(to right, #fbc8d5,#9896f0 );
    }

    .inner-left{
/*    	background-color: midnightblue;*/
		padding: 25px;
    }

    

    .leftdiv p {
    	color: midnightblue;
    	margin-left: 3%;
    	font-size: 20px;
    	font-family: 'Copperplate Gothic';
    	font-weight: 200;
    	margin-top: 6%;
    }


    .rightdiv{
        border: 1px solid transparent;
        height: auto;
        width: 48%;
        float: right;
    }

    .rightdiv p{
        font-size: 20px;
        font-family: 'Copperplate Gothic';
        font-weight: 500;
        margin-left: 5%;
        margin-top: 20.7%;
    }

    .rightdiv h2{
        font-size: 20px;
        font-family: 'Copperplate Gothic';
        font-weight: 500;
        margin-left: 25%;
        color: red;
    }

    .rightdiv h3{
        text-align: center;
        margin-top: 10%;
        color: midnightblue;
        font-weight: 500;
        font-family: 'Copperplate Gothic';
    }

    .rightdiv h3 a{
        text-decoration: none;
        color: #3a2767;
        padding: 5px;
        transition: padding 0.4s ease;
        cursor: pointer;
        font-weight: 500;
        font-family: 'Copperplate Gothic';
    }

    .rightdiv h3 a:hover {
        padding: 10px;
        color: darkblue;
        text-decoration: none;
    }

    ::selection{
        color: white;
        background-color: #168AAD;
    }


    @media screen and (max-width:800px) {
  .column {
    width: 100%;
  }

  form {
  	width: 300px;
  }

  .leftdiv {
  	width: 80%;
  }

  .rightdiv {
  	  	width: 80%;
  	margin-right: 10%;
  }
}

    ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
/*  background-color: #a000c8;*/
	background-image: linear-gradient(to right, #fdfcfb, #fbc8d5);
}

li {
  float: left;

}

li a{
	font-size: 18px;
	font-weight: 300;
  display: inline-block;
  color: midnightblue;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-family: 'Copperplate Gothic';
  transition: 0.3s ease;
  border-radius: 5px;
}

li a:hover {
  background-color: lavender;
  color: black;
}

.header {
      background-color: #9896f0;
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

    
</style>

<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("myInput");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
</head>
<body>
	<div class="header">
		<p>Welcome To Hospital Management</p>
	</div>
	<div class="topnav">
		<ul>
			<li style="margin-left: 10px;"><a href="HMS.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			
		</ul>
	</div>

	<div class="row">
		<div class="column"> 
			
			<div class="leftdiv">
		<p>Login to hospital user</p>
		
		<form action="UserValidateServlet" class="form" method="post">
			<div class="inner-left">
				<label for="user id">User Id:</label>
				<input type="text" name="userid" required placeholder="Enter your id">
				<label for="user password">Password:</label>
				<input type="password" name="password" required placeholder="Enter your password" id="myInput">
				<input type="checkbox" onclick="myFunction()">Show Password
				<button type="submit">Login</button>
			</div>
		</form>
	</div>

	<div class="rightdiv">
		<h2>Your Login id <%=session.getAttribute("userRegisterId") %></h2>
		<p>Hello User Welcome to the Hospital Management System.</p>

        	<h3>New User?<a href="userregister.jsp">&nbsp;Sign up</a></h3>
	</div>
		</div>
	</div>
</body>
</html>