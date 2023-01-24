<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS | Admin Registration</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
    
    * {
        box-sizing: border-box;
    }
    
    body {
        margin: 0;
    	background-color: #2c2c2c;
    }
    
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: transparent;
    border-bottom: 1px solid #01fff4;
}

li {
  float: left;
  
}

li a{
  display: inline-block;
  color: white;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-family: 'Copperplate Gothic';
  transition: 0.34s ease;
  border-radius: 5px;
  font-weight: 1000;
}

li a:hover{
  background-color: #f5f5f5;
  color: black;
}

.header p {
	color: white;
	text-align: center;
	margin-top: 0;
	font-weight: bolder;
	font-family: 'Copperplate Gothic';
	font-size: 18px;
	padding: 5px 0px;
	text-decoration: underline;
}

.header {
	margin-top: 0;
	box-shadow: 0px 2px 0px 0px transparent;
/*	background-color: #18191A;*/
}

#welcome {
  margin-top: 0;
  display: inline-block;
  color: white;
  text-align: center;
  padding: 10px 16px;
  font-family: 'Copperplate Gothic';
  font-weight: 1000;
  margin-left: 20.7%;
}

form {
	margin-left: auto;
	margin-right: auto;
	width: 550px;
	padding: 12px 25px;
	box-shadow: 0px 1px 2px 0px #7cff01,
            1px 2px 4px 0px #7cff01,
            2px 4px 8px 0px #7cff01,
            2px 4px 16px 0px #7cff01;
	border-radius: 8px;
	border: none;
	background-color: transparent;
	transition: 0.34s;
}

form:hover {
	padding: 25px;
	box-shadow: 0px 1px 2px 0px rgba(0,255,255,0.7),
            1px 2px 4px 0px rgba(0,255,255,0.7),
            2px 4px 8px 0px rgba(0,255,255,0.7),
            2px 4px 16px 0px rgba(0,255,255,0.7);
}

 input,select,textarea {
    width: 100%;   
    margin: 8px 0;  
    padding: 12px 20px;   
    display: inline-block;   
    border: 3px solid transparent ;   
    box-sizing: border-box;
    outline: none;   
    border-radius: 5px;
    font-size: 18px;
    color: #808080;
    transition: 0.34s ease;
  }  

  input:focus, select:focus, textarea:focus {
  	box-shadow: 0px 0px 0px 2px #7cff01;
  }

 input::placeholder, textarea::placeholder, select {
 	color: gray;
 }

 button {
 	width: 50%;   
    margin: 8px 0;  
    padding: 12px 20px;   
    display: block;     
    box-sizing: border-box;
    outline: none;   
    border-radius: 5px;
    font-size: 18px;
    border: none;
    transition: 0.34s ease;
    background-color: #00008b;
    color: white;
 	margin-left: auto;
 	margin-right: auto;
 }

 button:hover {
 	width: 100%;
 	opacity: 0.8;
 }
 
@media screen and (max-width: 800px) {
  #welcome {
  	margin-left: 10.7%;
  }

  form {
  	width: 500px;
  }
}

#demo1,#demo2,#demo3,#demo4,#demo5,#demo6 {
	font-size: 15px;
	margin: 0;
	padding-left: 2%;
	color: red;
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

.button-text:hover, .button-icon:hover {
	color: black;
}

.button-icon {
  font-size: 1.5em;
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
  font-weight: 1000;
  cursor: pointer;
  transition: 0.34s;
}


</style>

</head>
<body>
    <div class="topnav">
  <ul>
    <li><a href="Adminlogin.html">Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <!-- <li id="welcome">Welcome Mani Hospitals</li> -->
    <li id="signin" style="float: right;">
    
    	 <a class="dropbtn" class="button-icon" href="Adminlogin.html">
      <span class="button-icon"><img src="user3.png"></span>
      <span class="button-text">Log in</span>
      </a>
    </li>
  </ul>
</div>

<div class="header">
	<p>fill form to register</p>
</div>

<div class="details_tab">
	<form method="post" onsubmit="return validateForm()" action="AdminRegisterServlet">
		<div class="personal">
			<input type="text" name="adminfname" placeholder="First Name..." id="name">
			<p id="demo1"></p>
			<input type="text" name="adminlname" placeholder="Last Name..." id="lname">
			<p id="demo1"></p>
			<select name="gender" id="gender">
				<option value="" >---Gender---</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			<p id="demo2"></p>
		</div>

		<div class="contact">
			<input type="email" name="email" placeholder="E-Mail..." id="mail">
			<p id="demo3"></p>
			<input type="text" name="mobilenumber" placeholder="Mobile Number..." maxlength="10" id="contact">
			<p id="demo4"></p>
			<textarea placeholder="Address(400) characters" name="address" id="address" rows="1" cols="20" style="resize: none;"></textarea>
			<p id="demo5"></p>
		</div>


		<div class="pass">
			<input type="password" name="pass1" placeholder="Enter Password..." id="pass">
			<input type="password" name="password" placeholder="Confirm Password..." id="repass">
			<p id="demo6"></p>
		</div>

		<div class="register">
			<button type="submit">submit</button>
		</div>
	</form>
</div>


<script type="text/javascript">
	function validateForm(argument) {
		var a = document.getElementById("name").value;
		var b = document.getElementById("lname").value;
		var c = document.getElementById("contact").value;

		if (a.length == "") {
			document.getElementById("name").style.borderColor = "red";
			
			return false;
		} else if(b.length == "") {
			document.getElementById("lname").style.borderColor = "red";
			return false;
		}  else if (document.getElementById("gender").value == ""){
			document.getElementById("gender").style.borderColor = "red";
			return false;
		}	else if (document.getElementById("mail").value == "") {
			document.getElementById("mail").style.borderColor = "red";
			return false;
		}	else if (isNaN(c)) {
			document.getElementById("demo4").innerHTML = "please Enter numeric value";
			document.getElementById("contact").style.borderColor = "red";
			
			return false;
		} else if (c.length == "" || c.length < 10) {
			document.getElementById("contact").style.borderColor = "red";
			document.getElementById("demo4").innerHTML = "Plase enter 10 digit number";
			return false;
		} else if (document.getElementById("address").value == "") {
			document.getElementById("address").style.borderColor = "red";
			return false;
		} else if (document.getElementById("pass").value == "" || document.getElementById("repass").value == "") {
			document.getElementById("pass").style.borderColor = "red";
			document.getElementById("repass").style.borderColor = "red";
			return false;

		} 
		else if (document.getElementById("pass").value != document.getElementById("repass").value){
			document.getElementById("pass").style.borderColor = "red";
			document.getElementById("repass").style.borderColor = "red";
			document.getElementById("demo6").innerHTML = "Passwords doesn't match";
			return false;
		}
		else {
			return true;
		}
	}
</script>

</body>
</html>