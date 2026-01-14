<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<title>Doctor Login | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
* {
<<<<<<< HEAD
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	background: white;
}

.header {
	padding: 10px;
	box-shadow: 0 0 1px 1px gainsboro;
}

.header > img {
 	max-width: 150px;
 	margin-left: 20px;
}

.container {
	top: 45%;
=======
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	
	
	background-color: white;
}

.header {
	padding: 18px;
	box-shadow: 0 0 10px #45a29e;
}

.header p {
	font-size: 20px;
	text-align: center;
	font-weight: 900;
	color: black;
}

.container {
	top: 50%;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
}

.form {
	width: 500px;
	margin: auto;
	padding: 25px;
<<<<<<< HEAD
	box-shadow: 0 0 1px 0px #168aaa;
	border-radius: 5px;
=======
	box-shadow: 0 0 5px 1px #168aaa;
	border-radius: 2px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
}

label {
	margin: 0;
}

.form input  {
	display: block;
	outline: none;
<<<<<<< HEAD
	padding: 10px 8px;
	border: 1px solid #168aaa;
	border-radius: 5px;
	background: transparent;
	font-size: 15px;
	width: 100%;
=======
	padding: 10px 5px;
	border: 2px solid #168aaa;
	background: transparent;
	font-size: 18px;
	width: 100%;
	border-radius: 2px;
>>>>>>> e06896c5d3b881a587992830e685134132707732
	transition-duration: .4s;
	margin: 12px 0;
}

.form input:focus {
	border-color: transparent;
	box-shadow: 0 0 0 2px #168aaa;
}

.form input:focus::placeholder {
	opacity: 0.6;
}

.form button {
	display: block;
	outline: none;
	padding: 10px 5px;
	border: 2px solid #168aaa;
	background: #168aaa;
	color: white;
	font-size: 18px;
	width: 100%;
	border-radius: 2px;
	transition-duration: .4s;
	margin: 12px 0;
	cursor: pointer;
}

.form button:hover {
	background: #168bbb
}

.back {
	width: 200px;
	margin: 15px auto;
	
}

.back button {
	display: block;
	display: block;
	outline: none;
	padding: 10px 5px;
	border: 2px solid #168aaa;
	background: white;
	color: #168aaa;
	font-size: 18px;
	width: 100%;
	border-radius: 2px;
	transition-duration: .4s;
	cursor: pointer;
}

.back button:hover {
	background: #168aaa;
	color:white;
}

.info {
	width: 300px;
	margin: auto;
}

.info p {
font-size: 14px;
	color: #168aaa
}

#checkbox {
	margin: 10px 5;
	border: 10px solid red;
	background-color: #eee;
	width: 16px;
}

#checkboxspan {
	display: flex;
	align-items: center;
	font-size: 15px;
	font-weight: normal;
}

.error {
	margin: 10px auto;
	background: rgba(255, 127, 127, 0.7);
	border: 1px solid rgba(255, 127, 127, 1);
	padding: 12px;
	border-radius: 1px;
	color: red;
}

@media screen and (max-width: 600px) {
	.form {
		width: 310px;
	}
}
</style>

</head>

<<<<<<< HEAD
<body onload="document.querySelector('.form').reset()">
	<div class="header">
		<img src="CSS/MANI_HOSPITAL.png">
	</div>

=======
<body onload="document.querySelector('.form').reset();">

	<div class="header">
		<p>Hospital Management System</p>
	</div>
>>>>>>> e06896c5d3b881a587992830e685134132707732

	<div class="container">
		<div class="f">
			
			<form action="DoctorValidateServlet" method="post" class="form">
				<c:if test="${doctorError != null}">
				<div class="error">${doctorError }</div>

			</c:if>
				<input type="text" name="doctorid" required
<<<<<<< HEAD
					placeholder="Doctor Id" maxlength="5"> <input
					type="password" name="doctoremail" required
					placeholder="Doctor Email" id="myInput"> <label
=======
					placeholder="Enter your id" maxlength="5"> <input
					type="password" name="doctoremail" required
					placeholder="Enter your email" id="myInput"> <label
>>>>>>> e06896c5d3b881a587992830e685134132707732
					id="checkboxspan"> <input type="checkbox" id="checkbox"
					onclick="myFunction()" id="checkboxspan">Show Email
				</label>

				<button type="submit">Login</button>
			</form>
		</div>

		<div class="back">
			<form action="HMS.jsp" method="post">
				<button type="submit">Back Home</button>
			</form>
		</div>

		<div class="info">
			<p>Your Login details will be given by administration.</p>
		</div>
	</div>


	<script type="text/javascript">
		function myFunction() {
			var x = document.getElementById("myInput");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
		
		
		setTimeout(() => {
			let get = document.getElementById('error');
			get.style.display = 'none';
			}, 10000);
		
</script>
</body>

</html>