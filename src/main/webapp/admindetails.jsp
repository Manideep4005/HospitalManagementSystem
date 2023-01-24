<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    
    <% Integer id = (Integer)session.getAttribute("adminAccountId"); 
       String userName = (String)session.getAttribute("adminName");
       
    %>
    
    <% 
    	String email = null;
    	String gender = null;
    	String address = null;
    	long contact = 0;
    	
    	
    	PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from admin where admin_id = ? and admin_name = ?");
    	pstmt.setInt(1, id);
    	pstmt.setString(2, userName);
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	while (rs.next()) {
    		email = rs.getString("email");
    		gender = rs.getString("gender");
    		address = rs.getString("address");
    		contact = rs.getLong("contact");
    		
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
	* {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      	/*background-image: linear-gradient(to right, #808080, #778899);*/
      	background-color: white;
    }

    .header {
      /*background-color: #809080;*/
      text-align: center;
      padding: 5px 0px;
      height: auto;
      margin-top: 0px;
    }

   

    .header p{
      margin: 0;
      font-weight: bolder;
      font-size: 18px;
      font-family: 'Copperplate Gothic';
      color: black;
      text-decoration: underline;
    }

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #778899;
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
  font-weight: bolder;
  transition: 0.1s ease;
  border-radius: 5px;
}

li a:hover, .dropdown:hover  {
  background-color: #d3d3d3;
  color: black;
  font-weight: 1000;
}

li.dropdown {
  display: inline-block;
  border-radius: 5px;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  margin-left: -80px;
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
  height: 36.6px;
  padding: 0;
  background: transparent;
  border: none;
  outline: none;
  overflow: hidden;
  font-family: 'Copperplate Gothic';
  font-size: 16px;
  font-weight: 300;
}

.dropbtn span{
  font-weight: 1000;
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


    .column{
      float: left;
/*      width: 33.33%;*/
      padding: 0px 15px 0px 15px;
      border: 1px solid red;
    }

    .column.side {
      width: 25%;

    }

    .column.middle {
      width: 50%;
    }

    .row:after{
      content: "";
      display: table;
      clear: both;
    }

    @media screen and (max-width:600px) {
      .column {
        width: 100% ;
      }
    }
		

		table {
			margin-left: auto;
			margin-right: auto;
			margin-top: 2%;
			box-shadow: 0px 3px 10px 0px #2edfff;
			border-radius: 10px;
			background-color: transparent;
			transition: 0.34s ease-in;
		}
	
		table:hover {
			box-shadow: 0px 0px 0px 1px #2edfff;
		}
	
		th,td{
			font-size: 20px;
			padding: 10px 15px;
			text-align: left;
		}

	.change_password{
		text-align: center;
		margin-top: 7%;
	}		

	.change_password p{
		font-weight: 500;
		font-size: 20px;
		font-family: 'Copperplate Gothic';
	}

	.change_password button{
		font-family: 'Copperplate Gothic';
		text-decoration: none;
		border: none;
		border-radius: 10rem;
		padding: 10px 8px;
		background-color: red;
		font-size: 15px;
		background-color: #AECFA4;
		color: black ;
		width: 100px;
		transition: 0.34s ease;
		cursor: pointer;
	}

	.change_password button:hover{
		
		width: 200px;
		background-color: #A1E1FA;
	}
</style>


</head>
<body>
	<div class="topnav">
  <ul>
    <li><a href="adminmodule.jsp" >Home</a></li>
    <li><a href="#">Contact Us</a></li>
    <li><a href="#">About us</a></li>
    <li class="dropdown" style="float: right; margin-right: 1px;">
      
      <a class="dropbtn" class="button-icon">
      <span class="button-icon"><img src="CSS/user.png"></span>
      <span class="button-text"><%=userName %></span>
      </a>


      <div class="dropdown-content">
        
        <a href="/HMS/logoutAdminServlet">Logout</a>
      </div>
    </li>
  </ul>
</div>

<div class="header">
  <p>My Account</p>
</div>
	
	<div class="details">
		<table>
			<tr>
				<th>ID:</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>Name:</th>
				<td><%=userName %></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><%=email %></td>
			</tr>
			<tr>
				<th>Gender:</th>
				<td> <%=gender %></td>
			</tr>
			<tr>
				<th>Address:</th>
				<td> <%=address %></td>
			</tr>
			<tr>
				<th>Contact:</th>
				<td><%=contact %></td>
			</tr>
			
			
		</table>
	</div>

	<div class="change_password">
	<p>Change Password click below</p>
		<form 	method="post" action="adminChangePassword.jsp">
			<button type="submit">Reset</button>
		</form>
	</div>
	
</body>
</html>