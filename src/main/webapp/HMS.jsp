<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Hospital Management System | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
body {
	background-color: white;
	font-family: 'Poppins', sans-serif;
}

* {
	margin: 0;
	box-sizing: border-box;
}

#logout a {
	float: right;
	color: black;
	padding: 8px;
	cursor: pointer;
	transition: 0.34s ease;
	text-decoration: none;
	font-size: 20px;
	margin-left: 0px;
	margin-top: 10px;
	position: sticky;
}

#logout a:hover {
	background: grey;
	color: white;
}

.topdiv {
	top: 0;
	left: 0;
	right: 0;
	background-color: white;
	position: sticky;
	box-shadow: 0 0 10px 2px black;
}

img {
	width: 20%;
	object-fit: contain;
	margin-left: 10px;
}

.main {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	width: 1000px; 
	display : grid;
	grid-template-columns: auto;
	align-content: center;
	justify-content: space-evenly;
	transition-duration: 0.4s;
	gap: 50px;
	padding: 20px;
	display: grid;
}

.child {
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.13);
	backdrop-filter: blur(10px);
	box-shadow: 0px 0px 8px 2px gray;
	border-radius: 10px;
	transition-duration: .4s;
	width: 300px;
}

 
.child button {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	display: block;
	font-size: 18px;
	text-decoration: none;
	padding: 10px 20px;
	border: 2px solid gray;
	background-color: gray;
	border-radius: 2px;
	color: white;
	cursor: pointer;
	transition: 0.34s;
	width: 100px;
	margin-top: 20px;
}

.child button:hover {
	border: 2px solid gray;
	color: black;
	background: transparent;
}

@media screen and (max-width:1000px) {
	 
	#logout a {
		font-size: 15px;
		margin-top: 2px;
		margin-left: 0px;
		font-weight: bolder;
	}
	.main {
		grid-template-columns: auto;
		gap: 45px;
		width: 300px;
	}
}

@media screen and (max-width:600px) {
	.child {
		
	}
	.topdiv {
		padding: 20px;
	}
	.main {
		grid-template-columns: auto;
		gap: 45px;
	}
	#admin {
		margin-top: 20px;
	}
	#user {
		margin-left: auto;
		margin-right: auto;
	}
	#doctor {
		float: none;
	}
	img {
		width: 30%;
		text-align: center;
	}
	.topdiv {
		padding: 5px;
	}
	#logout a {
		font-size: 15px;
		margin-top: 8px;
		margin-left: 0px;
		font-weight: bolder;
	}
}

@media screen and (max-width:529px) {
	#logout a {
		margin-top: -5px;
	}
}
</style>
</head>
<body>
	<div class="topdiv">
		<span><a href="HMS.jsp"><img src="CSS/HMSLOGO.jpg"></a></span> <span
			id="logout" ><a href="#" style="margin-right: 10px;">About us</a></span> <span id="logout"><a
			href="#">Contact us</a></span> <span id="logout"><a href="HMS.jsp">Home</a></span>

	</div>

	<div class="main">

		<div class="child" id="admin">
			<form action="Adminlogin.jsp" method="post">
				<h2>Admin Login</h2>
				<button type="submit">Login</button>
			</form>

		</div>

		<div class="child" id="user">
			<form action="Userlogin.jsp" method="post">
				<h2>User Login</h2>
				<button type="submit">Login</button>
			</form>
		</div>

		<div class="child" id="doctor">
			<form action="Doctorlogin.jsp" method="post">
				<h2>Doctor Login</h2>
				<button type="submit">Login</button>
			</form>
		</div>
	</div>
</body>
</html>