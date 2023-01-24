<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mani Hospitals | HMS</title>
	<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

	<style type="text/css">
		body {
			margin: 0;
			background-color: white;
		}

		* {
			box-sizing: border-box;
		}
		#logout a{
			float: right;
			color: black;
			padding: 8px;
			cursor: pointer;
			transition: 0.34s ease;
			text-decoration: none;
			font-size: 20px;
			margin-left: 10px;
			margin-top: 5px;
		}

		#logout a:hover{
			
			color: #ff2903;
		}


		.topdiv{
			border: 1px solid transparent;
			padding: 10px;	
			top: 0;
			left: 0;
			right: 0;
			background-color: white;
			border-radius: 1px;
			box-shadow: 0px 1px 0px 0px rebeccapurple;
		}

		img{

			width: 15%;
			background-color: ;

		}

		
		.main {
			
			display: table;
			clear: both;
			width: 100%;
		}

		.child {
			float: left;
			width: 30%;
			padding: 20px;
			border: 1px solid red;
			margin-top: 10%;
			text-align: center;
		}

		h2 {
			color: rebeccapurple;
		}

		.child a{
			font-size: 18px;
			text-decoration: none;
			padding: 8px 10px;
			border: none;
			background-color: #9a9a9a;
			border-radius: 10px;
			color: white;
			cursor: pointer;
			transition:  0.34s ease;
		}

		.child a:hover {
			background-color: purple;
			padding: 10px 50px;
			border-radius: 5pc;
			
		}

		#admin, #user, #doctor{
			background-color: transparent;
			border: none;
			box-shadow: 0px 0px 10px 2px #ff2903;
			margin-right: 2%;
			border-radius: 10px;
			transition: 0.34s ease;
		}
		
		#admin:hover, #user:hover, #doctor:hover {
			border-radius: 100px;
			box-shadow: 0px 0px 10px 0px #13f4ef;
			background-color: #FF0053;
		}

		#admin {
			margin-left: 3%;
		}

		@media screen and (max-width:800px) {
  .child {
    width: 100%;
    margin-left: 0%;
    margin-top: 5%;
  }

  .child a:hover {
  	padding: 12px 50px;
  	font-weight: 0;
  	font-size: 20px;

  }

  #admin {
  	margin-left: auto;
  }

  #logout a {
  	margin-top: -6px;
  }

  img {
  	width: 20%;
  }
}

		
	</style>
</head>
<body>
	<div class="topdiv">
		<span><img src="CSS/HMSLOGO.jpg"></span>
		<span id="logout"><a href="#">About us</a></span>
		<span id="logout"><a href="#">Contact us</a></span>
		<span id="logout"><a href="HMS.jsp">Home</a></span>

	</div>
		
	<div style="margin-top: 2%;" class="main">
		<div class="child" id="admin">
			<h2>Admin Login</h2>
			<p><a href="Adminlogin.html">Login</a></p>
		</div>

		<div class="child" id="user">
			<h2>User Login</h2>
			<p><a href="Userlogin.html">Login</a></p>
		</div>

		<div class="child" id="doctor">
			<h2>Doctor Login</h2>
			<p><a href="Doctorlogin.html">Login</a></p>
		</div>
	</div>
</body>
</html>