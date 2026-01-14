<%@page import="java.sql.ResultSet"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="com.hms.db.CurrentDate"%>
<%@include file="doctorSessionValidate.jsp"%>
<%
Date date = CurrentDate.getCurrnetDate();
//out.println(date);

String specialization = (String) session.getAttribute("doctorSpecialization");

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where appointment_date = ? and checkup_type=?");
pstmt.setDate(1, date);
pstmt.setString(2, specialization);

int count = 0;
boolean resultSetIsEmpty = true;
ResultSet rs1 = pstmt.executeQuery();
while (rs1.next()) {
	count++;
}

ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments | HMS</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">
<style type="text/css">
@charset "ISO-8859-1";

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
	box-sizing: border-box;
}

body {
	background-color: #fffff7;
}



ul {
	list-style-type: none;
	margin: 0;
	padding: 10px;
	overflow: hidden;
	box-shadow: 0 2px 8px #C9C9BC;
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 10px 16px;
	text-decoration: none;
	font-weight: 300;
	transition-duration: 0.8s;
	font-weight: 600;
}

li a:hover, .dropdown:hover {
	background-color: #C9C9BC;
	color: white;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #C9C9BC;
	min-width: 160px;
	margin-left: -28px;
	box-shadow: 0 1px 5px black;
	transition: 0.34s ease;
	border-radius: 1px;
	z-index: 1;
	text-align: left;
}

.dropdown-content:hover {
	
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 600;
	transition: 0.34s ease;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #fffff7;
	color: black;
}

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
	font-size: 16px;
	font-weight: 600;
}

.dropbtn span:hover, .dropbtn span {
	font-weight: bolder;
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
}

.button-icon {
	font-size: 1.5em;
}

.scroll {
	overflow-y: auto;
	height: 500px;
}

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 2%;
	border-spacing: 0;
	border-collapse: collapse;
}

th {
	padding: 8px 10px;
	font-size: 18px;
	background-color: #f1f1f1;
	border: 1px solid #ccc;
	text-align: left;
	top: -1px;
	position: sticky;
}

td {
	text-align: left;
	border: 1px solid #ccc;
	padding: 8px 10px;
	font-size: 18px;
	border: 1px solid #ccc;
}

h1 {
	text-align: center;
	color: black;
}


.back button {
	font-size: 15px;
	border: none;
	background-color: #445454;
	color: white;
	padding: 8px 10px;
	width: 100px;
	transition: 0.34s ease;
	cursor: pointer;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 2%;
}

.back button:hover {
	opacity: 0.9;
}


@media screen and (max-width:729px) {
	
	.button-icon {
		font-size: 1em;
	}
	.button-text, .button-icon {
		padding: 5px;
		height: 100%;
	}
	.dropdown-content {
		min-width: 100px;
		margin-left: -25px;
	}
	.scroll {
		overflow-y: auto;
		height: 350px;
		width: 350px;
		margin-left: auto;
		margin-right: auto;
	}
	table {
		border: 1px solid red;
		margin-top: 5%;
	}
	th, td {
		padding: 8px 2px;
		font-size: 14px;
	}
}

#patient_id {
	text-decoration: none;
	color: dodgerblue;
	transition-duration: .4s;
}

#patient_id:hover {
	color: darkorange;
}
</style>
</head>
<body>
	<div class="topnav">
		<ul>
			<li><a href="doctormodule.jsp">Home</a></li>
			<li><a href="#">Contact Us</a></li>
			<li><a href="#">About us</a></li>
			<li class="dropdown" style="float: right; margin-right: 1px;"><a
				class="dropbtn" class="button-icon"> <span class="button-icon"><img
						src="CSS/user.png"></span> <span class="button-text"><%=session.getAttribute("doctorAccountName")%></span>
			</a>


				<div class="dropdown-content">
					<a href="#">My ID: <%=session.getAttribute("doctorAccountId")%></a>
					<a href="doctordetails.jsp">My Details</a> <a
						href="LogoutDoctorServlet">Logout</a>
				</div></li>
		</ul>
	</div>



	<div class="">



		<%
		//if (count == 0) {
		//out.println("<h1>No Appointments</h1>");
		//}

		if (resultSetIsEmpty) {

		
			out.println("<div class=\"scroll\">");
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Patient Id</th>");
			out.println("<th>Appointment Id</th>");
			out.println("<th>First Name</th>");
			out.println("<th>Last Name</th>");
			out.println("<th>Check-up</th>");
			out.println("<th>Appointment Date</th>");
			out.println("</tr>");
			while (rs.next()) {
				resultSetIsEmpty = false;
				out.println("<tr>");
				out.println("<td><a id=\"patient_id\" href=\"doctorViewPatientDetails.jsp?patientId="+rs.getInt("patient_id") +"\">" + rs.getInt("patient_id") + "</a></td>");

				out.println("<td>" + rs.getInt("appointment_id") + "</td>");
				out.println("<td>" + rs.getString("patient_firstname") + "</td>");
				out.println("<td>" + rs.getString("patient_lastname") + "</td>");
				out.println("<td>" + rs.getString("checkup_type") + "</td>");
				out.println("<td>" + rs.getDate("appointment_date") + "</td>");
				out.println("</tr>");
			}
			if (resultSetIsEmpty) {
				out.println("<h1>No Appointments</h1>");

			}

			out.println("</table>");
			out.println("</div>");
		}
		%>


	</div>

	<div class="back">
		<form action="doctormodule.jsp" method="post">
			<button type="submit">Go Back</button>
		</form>
	</div>


	<script type="text/javascript">
		function validate() {

			var y = document.getElementById("one").value;

			if (isNaN(y)) {
				document.getElementById("demo").innerHTML = "Enter Numbers Only.";
				return false;
			} else if (y.length == "" || y.length < 5) {
				document.getElementById("demo").innerHTML = "Please Enter 5 Digit \"Patient ID\"";
				return false;
			} else {
				return true;
			}

		}
	</script>
</body>
</html>
