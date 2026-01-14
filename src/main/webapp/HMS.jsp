<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Hospital Management System</title>
    <link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "poppins", sans-serif;
        background-color: #f9f9f9;
        color: rgb(56, 55, 55);
      }

      ul > li {
        list-style-type: none;
        list-style-position: inside;
      }

      .links li a {
        text-decoration: none;
        font-size: 17px;
        color: gray;
        transition: 0.4s;
        display: block;
      }

      .links li a:hover {
        color: black;
        transform: scale(1.1);
      }

      .logo ul > li > a:hover {
        transform: none;
      }

      .header {
        background-color: #f9f9f9;
        padding: 12px;
        box-shadow: 0 0 5px gainsboro;
        position: sticky;
        top: 0;
      }

      .header img,
      .header-2 img {
        max-width: 200px;
      }

      .header nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .links ul {
        display: flex;
        gap: 15px;
      }

      .header-2 {
        box-shadow: 0 0 3px 1px gainsboro;
        padding: 12px;
        top: 0;
        position: sticky;
        background-color: #f9f9f9;
        display: none;
      }

      .header-2 > nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      #open-sidebar-btn {
        cursor: pointer;
        outline: none;
        padding: 5px;
        border: none;
        background: transparent;
        color: dodgerblue;
        font-size: 20px;
        transition: 0.4s;
      }

      #open-sidebar-btn:hover {
        color: #3de397;
      }

      .sidebar {
        background-color: #fffff7;
        position: fixed;
        width: 0;
        height: 100%;
        top: 0;
        left: 0;
        display: flex;
        flex-direction: column;
        gap: 100px;
        overflow-x: hidden;
        z-index: 10;
        transition: 0.5s cubic-bezier(0.45, 0.45, 0.45, 0.45);
      }

      #close-sidebar-btn {
        cursor: pointer;
        margin: 10px 20px;
        float: right;
        color: gray;
        background: transparent;
        border: none;
        font-size: 20px;
      }

      .sidebar-links > ul {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
      }

      .sidebar-links > ul > li > a {
        text-decoration: none;
        color: grey;
        display: block;
        font-size: 18px;
        transition: 0.4s;
      }

      .sidebar-links > ul > li > a:hover {
        transform: scale(1.05);
        color: black;
      }

      .sidebar-links > ul > li > a:active {
        transform: scale(0.8);
        color: black;
      }

      .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        z-index: 5;
      }

      .container {
        margin-top: 10px;
        padding: 20px;
      }

      .container div {
        border-radius: 5px;
        padding: 10px;
        margin: 20px auto;
        max-width: 100%;
        box-shadow: 0 0 0 1px gainsboro;
      }

      .container div > form {
        max-width: 150px;
        margin: 10px auto;
      }

      .container div > form > button {
        width: 100%;
        outline: none;
        background-color: rgb(135, 179, 223);
        border: none;
        font-size: 17px;
        padding: 10px;
        border-radius: 5px;
        color: white;
        cursor: pointer;
        transition: 0.4s;
      }

      .container div > form > button:hover {
        background-color: rgb(74, 113, 152);
      }

      .container div > p {
        padding: 20px;
      }

      @media screen and (max-width: 600px) {
        .header-2 {
          display: block;
        }

        .header {
          display: none;
        }

        .links ul {
          gap: 8px;
        }

        .logo {
          margin-left: 0px;
        }

        .links {
          margin-right: 0px;
        }
        li a {
          font-size: 14px;
        }
        .header img,
        .header-2 img {
          max-width: 130px;
        }
      }
    </style>
  </head>
  <body>
    <div class="header">
      <nav>
        <div class="logo">
          <ul>
            <li>
              <a href="HMS.jsp"><img src="CSS/MANI_HOSPITAL.png" alt="" /></a>
            </li>
          </ul>
        </div>

        <div class="links">
          <ul>
            <li><a href="HMS.jsp">HOME</a></li>
            <li><a href="javascript::void(0)">CONTACT US</a></li>
            <li><a href="javascript::void(0)">ABOUT US</a></li>
          </ul>
        </div>
      </nav>
    </div>

    <!-- HEADER 2 AND SIDE BAR -->

    <div class="header-2">
      <nav>
        <div class="logo">
          <ul>
            <li>
              <a href="HMS.jsp"><img src="CSS/MANI_HOSPITAL.png" alt="" /></a>
            </li>
          </ul>
        </div>

        <div class="open-sidebar">
          <button id="open-sidebar-btn"><i class="fa fa-bars"></i></button>
        </div>
      </nav>
    </div>

    <div class="sidebar">
      <div class="close-sidebar">
        <button id="close-sidebar-btn"><i class="fa fa-arrow-left"></i></button>
      </div>

      <div class="sidebar-links">
        <ul>
          <li><a href="HMS.jsp">HOME</a></li>
          <li><a href="javascript::void(0)">CONTACT US</a></li>
          <li><a href="javascript::void(0)">ABOUT US</a></li>
        </ul>
      </div>
    </div>

    <div class="overlay"></div>

    <!-- END OF HEADER AND SIDEBAR -->

    <div class="container">
      <div class="user">
        <h2>User Module</h2>
        <p>
          Login as user and have previliges to book an appointment and see the
          availability of doctors. And also can update their profile can also
          view the history of appointments.
        </p>

        <form action="Userlogin.jsp" method="POST">
          <button type="submit">User Login</button>
        </form>
      </div>
      <div class="admin">
        <h2>Admin Module</h2>
        <p>
          Login as admin and have access to all the modules and manage the whole
          application, where admin can register a doctor and send the login
          creditentials to the doctor over mail. can perform CURD operations
          Patient details as well as on his account.
        </p>
        <form action="Adminlogin.jsp" method="POST">
          <button type="submit">Admin Login</button>
        </form>
      </div>

      <div class="doctor">
        <h2>Doctor Module</h2>
        <p>
          Login as doctor to see the appointments for the day along with the
          patient history and details.
        </p>
        <form action="Doctorlogin.jsp" method="POST">
          <button type="submit">Doctor Login</button>
        </form>
      </div>
    </div>

    <script>
      const sidebar = document.querySelector(".sidebar");
      const open_sidebar = document.getElementById("open-sidebar-btn");
      const close_sidebar = document.getElementById("close-sidebar-btn");
      const overlay = document.querySelector(".overlay");

      open_sidebar.addEventListener("click", () => {
        sidebar.style.width = "300px";
        overlay.style.display = "block";
      });

      close_sidebar.addEventListener("click", () => {
        sidebar.style.width = "0";
        overlay.style.display = "none";
      });

      overlay.addEventListener("click", () => {
        sidebar.style.width = "0";
        overlay.style.display = "none";
      });

      document.addEventListener("keydown", function (e) {
        if (e.key === "Escape") {
          sidebar.style.width = "0";
          overlay.style.display = "none";
        }
      });
    </script>
  </body>
</html>
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
