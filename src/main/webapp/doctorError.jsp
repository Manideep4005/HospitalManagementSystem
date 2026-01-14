<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor | Login</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	body {
		margin: 0;
/*        background-color: #734f96	;*/
		background-image: linear-gradient(to right, #11998E , #38EF7D);
	}
	

    

    label{
    	font-size: 20px;
        color: white;
        font-weight: 400;
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
        border: 0px solid transparent;
        width: 500px;
        margin-left: 15%;
        box-shadow: 3px 3px 9px #C6EA8D;
              
        border-radius: 0% 5pc;
        background-image: linear-gradient(to left, #11998E , #38EF7D );
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
		transition:padding,font-size 0.4s ease;
    }

    button:hover{
    	background-image: linear-gradient(to right, #D8B5FF , #1EAE98);
   		font-size: 20px;
   		padding: 17px;
    }

    .leftdiv{
    	width: 50%;
    	height: 70vh;
/*    	position: fixed;*/
    	border-top-right-radius: 100%;
    	border-bottom-right-radius: %;
/*    	background-color: #8a00c2;*/
        float: left;
/*        box-shadow: 10px 0px 0px 0px #808080;*/
        margin-top: 4%;
/*        background-image: linear-gradient(to right, #11998E , #38EF7D );*/
		
    }

    .inner-left{
/*    	background-color: midnightblue;*/
		padding: 25px;
    }

    

    .leftdiv p {
    	color: #fff;
    	margin-left: 16%;
    	font-size: 20px;
    	font-family: 'Copperplate Gothic';
    	font-weight: 200;
    	margin-top: 5%;
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
        margin-top: 25%;
        color: darkblue;
    }

    .rightdiv h2{
        font-size: 20px;
        font-family: 'Copperplate Gothic';
        font-weight: 500;
        margin-left: 25%;
        color: red;
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
  	width: 40%;
  }

  .rightdiv {
  	  	width: 35%;
  
  }
}

@media screen and (max-width:1200px) {
  .column {
    width: 100%;
  }

  form {
  	width: auto;
  }

  .leftdiv {
  	width: 50%;
  }

  .rightdiv {
  	  	width: 40%;
  
  }
}

    ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #11998e;
	
}

li {
  float: left;

}

li a{
	font-size: 18px;
	font-weight: 300;
  display: inline-block;
  color: white;
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
      background-color: #38EF7D;
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

    #checkboxspan{
    	color: white;
    	margin-top: 0;
    	font-weight: 200;
    	font-size: 17px;
    }

    ::selection{
        color: white;
        background-color: #168AAD;
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
		<p>Login to Hospital Doctor</p>
		
		<form action="DoctorValidateServlet" class="form" method="post">
			<div class="inner-left">
				<label for="user id">Doctor Id :</label>
				<input type="text" name="doctorid" required placeholder="Enter your id" maxlength="5">
				<label for="user password">Email :</label>
				<input type="password" name="doctoremail" required placeholder="Enter your email" id="myInput">
				<input type="checkbox" onclick="myFunction()"><span id="checkboxspan">Show Email</span>
				<button type="submit">Login</button>
			</div>
		</form>
	</div>

	<div class="rightdiv">
			<h2>Invalid Doctor Id or Email</h2>
			<p>Hello Doctor Welcome to the Hospital Management System.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login to your account to view the appointments of the patients. Your Login id will be given by Administration. Found any issues while sign in contact Administrtaion.</p>
		</div>
		</div>
	</div>
</body>
</html>
