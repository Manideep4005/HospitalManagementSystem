<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="userSessionValidate.jsp"%>
<%@page errorPage="userError.jsp"%>
<% 
Integer patientId = (Integer) session.getAttribute("userPatientId");

PreparedStatement pstmt = MySqlConnection.getConnection()
		.prepareStatement("select * from patient where patient_id = ?");
pstmt.setInt(1, patientId);

String patientfName = "";
String patientlName = "";
String gender = "";
int age = 0;
long contact = 0;
String address = "";
String checkup_type = "";

int appointmentId = 0;
Date appointmentDate = null;

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	patientfName = rs.getString("patient_firstname");
	patientlName = rs.getString("patient_lastname");
	gender = rs.getString("gender");
	age = rs.getInt("age");
	address = rs.getString("address");
	contact = rs.getLong("contact");
	checkup_type = rs.getString("checkup_type");
}

PreparedStatement pstmt2 = MySqlConnection.getConnection()
		.prepareStatement("select * from appointment where patient_id = ?");
pstmt2.setInt(1, patientId);

ResultSet rs2 = pstmt2.executeQuery();

while (rs2.next()) {
	appointmentDate = rs2.getDate("appointment_date");
	appointmentId = rs2.getInt("appointment_id");
}

String patientName = patientfName + " " + patientlName;

if (gender.equals("male")) {
	patientName = "Mr. " + patientName;
} else if (gender.equals("female")) {
	patientName = "Miss. " + patientName;
} else if (gender.equals("female") && age > 26) {
	patientName = "Mrs. " + patientName;
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Success | HMS</title>
<title>Appointment Booked | HMS</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<style type="text/css">
body {
	margin: 0;
}

* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

.heading p {
	text-align: center;
	font-size: 20px;
	font-weight: 1000;
}

.details {
	margin-right: auto;
	margin-left: auto;
	margin-top: 2%;
	width: 600px;
	display: flex;
}

.d {
	flex: 1;
}

 

.d p {
	text-align: left;
	font-size: 14px;
	font-weight: 600;
	text-transform: capitalize;
}

.line hr {
	margin-top: 2.5%;
	width: 600px;
	color: black;
	border-top: 2px solid black;
}

.back button {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	padding: 16px 32px;
	font-size: 16px;
	background-color: transparent;
	border: 2px solid #008CBA;
	font-weight: 600;
	cursor: pointer;
	transition-duration: 0.4s;
}

.back button:hover {
	color: white;
	background-color: #008CBA;
}

.info {
	font-weight: 1000;
}

@media screen and (max-width: 600px) {
	.details {
		width: 350px;
	}
	.line hr {
		width: 350px;
	}
	.d p {
		font-size: 13px;
	}
}
</style>
<body>
	<div class="heading">
		<p>Appointment Successfully Booked</p>
	</div>

	<div class="details">
		<div class="d1 d">
			<p>
				Patient Id:&nbsp;<span class="info"><%=patientId %></span>
			</p>
			<p>
				Patient Name:&nbsp;<span class="info"><%=patientName %></span></p>
			<p>
				Age:&nbsp;<span class="info"><%=age %>&nbsp;Years</span>
			</p>
			<p>
				Gender:&nbsp;<span class="info"><%=gender %></span>
			</p>
			<p>
				Contact:&nbsp;<span class="info"><%=contact %></span>
			</p>
		</div>

		<div class="d2 d">
			<p>
				Appointment Id:&nbsp;<span class="info"><%=appointmentId %></span>
			</p>
			<p>
				Appointment_date:&nbsp;<span class="info"><%=appointmentDate %></span>
			</p>
			<p>
				Check-up Type:&nbsp;<span class="info"><%=checkup_type %></span>
			</p>
			<p>
				Address:&nbsp;<span class="info"><%=address %></span>
			</p>
		</div>
	</div>

	<div class="line">
		<hr>
	</div>

	<div class="back">
		<form action="usermodule.jsp" method="post">
			<button type="submit">Go back</button>
		</form>
	</div>
</body>
</html>
