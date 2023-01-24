<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details | HMS</title>
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
  background-color: #F6D7AF;
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



    input::placeholder{
        font-weight: bold;
        opacity: 0.6;
        font-size: 15px;
    }   
    

    label {
    font-size: 20px;
        color: midnightblue;
        font-weight: 200;
        font-family: 'Copperplate Gothic';
}

input {
    width: 100%;   
    margin: 8px 0;  
    padding: 12px 20px;   
    display: inline-block;   
    border: 1px solid #808080;   
    box-sizing: border-box;
    outline: none;   
    border-radius: 5px;
    font-size: 18px;
    color: #808080;
    }  

     input:focus{
        border: 1px solid #317AC7;
    }


form {
     width: 500px;
        box-shadow: 0px 0px 0px 1px gainsboro;
        border-radius: 1%;
        margin-right: auto;
        margin-left: auto;
        padding: 50px 30px;
}

button {
   background-color: #168AAD;   
        width: 100%;  
        color: white;   
        padding: 12px 20px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
        margin-right: auto;
        margin-left: auto;
        text-align: center;
        display: block;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: 0.34s ease;
    box-shadow: 0 1rem 1.25rem 0 rgba(22,75,195,0.50), 0 -0.25rem 1.5rem 
                                 #168AAD inset;

        
}

button:hover {
    opacity: 0.8;
}

h1 {
    text-align: center;
    font-family: cursive;
}

#demo, #demo1 {
    font-size: 15px;
    margin-top: 0;
    padding-left: 10px;
    color: red;
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
        <a href="adminViewPatients.jsp">Patients List</a>
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>



<!-- <div class="nav">
        <p>Search Patients</p>
        <div class="login-container">
            <form method="post" action="adminSearchPatientDetails.jsp">
                <input type="text" name="mobilenumber" required maxlength="5" placeholder="Contct...">&nbsp;&nbsp;
                 <button type="submit">view</button>
            </form>
        </div>
    </div> -->


    <div class="get_details">
        <div class="search" >
        <h1>Get Details</h1>
        <form action="adminGetPatientDetails.jsp" method="post" onsubmit="return check()">
            <label>Patient Id</label>
            <input type="text" name="patientid" maxlength="5" placeholder="Enter Id..." id="one"  >
            <p id="demo"></p>
            <label>Mobile Number</label>
            <input type="text" name="mobilenumber" maxlength="10" id="one1" placeholder="Contact..." >
            <p id="demo1"></p>
            <button type="submit">Submit</button>
            
        </form>
    </div>
    </div>



    <script type="text/javascript">
        function validateForm() {
            var x = document.getElementById("one").value;
           

            if (isNaN(x)) {
                document.getElementById("demo").innerHTML = "Enter Numeric digits only";
                return false;
            }
            if (x.length == "" || x.length < 5) {
                document.getElementById("demo").innerHTML = "please enter 5 digit ID";
                return false;
            }
            else {
                
                return true;
            }
            
            
        }

        function validate() {
             var y = document.getElementById("one1").value;

            if (isNaN(y)) {
                document.getElementById("demo1").innerHTML = "Enter Numeric digits only";
                return false;
            }
            if (y.length == "" || y.length < 10) {
                document.getElementById("demo1").innerHTML = "please enter 10 digit number";
                return false;
            }
            else {
                
                return true;
            }
        }


        function check() {
            return validateForm() && validate();
        }
    </script>

</body>
</html>