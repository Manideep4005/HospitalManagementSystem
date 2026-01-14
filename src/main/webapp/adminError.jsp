<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
	
	body {
		margin: 0;
		/*background-image: linear-gradient(to left, #2e3192, #1bffff);*/
		background-color: white;
	}

	* {
		box-sizing: border-box;
	}

    label{
    	font-size: 20px;
        color: balck;
        font-weight: 200;
        font-family: 'Copperplate Gothic';
    }

    input[type=text], input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid lightgray;   
        box-sizing: border-box;
        outline: none;   
        border-radius: 5px;
        transition: 0.34s ease;
    }  

    
    input:focus{
    	border: 2px solid #317AC7;
    }

    form {   
        border: 3px solid transparent;
        width: 500px;
        margin-left: auto;
        margin-right: auto;
/*        box-shadow: 0px 0px 20px 0px #808080;*/
        border-radius: 5%;
        /* background-color: rgba(255,255,255,0.13);
         backdrop-filter: blur(10px);*/
         box-shadow: 0px 0px 3px 0px midnightblue;
    }   

    button {   
      	background-color: #317AC7;
		
       	width: 100px;  
        color: white;   
        padding: 10px 12px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
		margin-right: auto;
		margin-left: auto;
		text-align: center;
		display: block;
		border-radius: 5px;
		cursor: pointer;
		transition:  0.34s ease;
		font-weight: 300;
		font-size: 18px;
    }

    button:hover{
    	
    	opacity:0.8;
    	
    }

   

    .inner-div{

		padding: 25px;
    }

    

    .leftdiv p {
    	color: midnightblue;
    	margin-left: 4%;
    	font-size: 20px;
    	font-family: 'Copperplate Gothic';
    	font-weight: 500;
    	margin-top: 22%;
    }

	#register1 {
	    	font-size:  20px;
	    	font-family: 'Copperplate Gothic';
	    	font-weight: 500;
	    	text-align: center;
	    	margin-top: 5%;
	    	
	    }


	#register1 a {
		text-decoration: underline;
		color: #2e3192;
		transition: padding 0.4s ease;
		font-weight: 500;
		border-radius: 5px;
		
	}

	#register1 a:hover {
		text-decoration: underline;
		color: midnightblue;
		padding: 0px 10px;
		background-color: transparent;

	}

    

    .rightdiv p{
        font-size: 20px;
        font-family: 'Copperplate Gothic';
        font-weight: 300;
        
        color: black;
        text-align: center;
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
  	width: 500px;
  }

 

}

    ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
/*  background-color: #a000c8;*/
	background-color: white;
	border-bottom: 1px ridge gray;
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
      background-color: white;
      text-align: center;
      padding: 8px 0px;
      height: auto;
      margin-top: 0px;
    }

   

    .header p{
      margin: 0;
      font-weight: bolder;
      font-size: 20px;
      font-family: 'Copperplate Gothic';
      color: black;

    }
	
	h2 {
		text-align: center;
		color: red;
	}
	
	
	
	
	.error p {
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: red;
		font-family: 'Copperplate Gothic';
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
			<li style="margin-left: 0px;"><a href="HMS.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			
		</ul>
	</div>
	
	<div class="error">
		<p>Invalid username or password </p>
	</div>
	
	<div class="row">
		<div class="column"> 

	<div class="rightdiv">
		<div class="upperdiv">
			<p>Login To Hospital Admin</p>
			<form action="AdminValidateServlet" method="post">
				<div class="inner-div">
					<label for="admin id">Admin Id:</label>
					<input type="text" name="adminid" required placeholder="enter your id" maxlength="5">
					<label for="admin password">Password:</label>
					<input type="password" name="password" required placeholder="enter your password" id="myInput">
					<input type="checkbox" onclick="myFunction()">Show Password
					<button type="submit">Login</button>
				</div>
			</form>
		</div>
	</div>
		</div>
	</div>
	
	<div class="new">
		<p id="register1">New Admin? <a href="adminregister.jsp">Sign up</a></p>
	</div>
</body>
</html>
