<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="com.hms.db.MySqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% Integer patientId= (Integer)session.getAttribute("userPatientId");
      
    	
      
    	
       PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("select * from patient where patient_id = ?");
       pstmt.setInt(1, patientId);
       
       String patientName = "";
       String gender = "";
       int age = 0;
       long contact = 0;
       String address = "";
       String checkup_type = "";
       
       int appointmentId = 0;
       Date appiintmentDate = null;
       
       ResultSet rs = pstmt.executeQuery();
       
       while (rs.next()) {
    	   patientName = rs.getString("patient_name");
    	   gender = rs.getString("gender");
    	   age = rs.getInt("age");
    	   address = rs.getString("address");
    	   contact = rs.getLong("contact");
    	   checkup_type = rs.getString("checkup_type");
       }
       
       PreparedStatement pstmt2 = MySqlConnection.getConnection().prepareStatement("select * from appointment where patient_id = ?");
       pstmt2.setInt(1, patientId);
       
       
       ResultSet rs2 = pstmt2.executeQuery();
       
       while (rs2.next()) {
    	   appiintmentDate = rs2.getDate("appointment_date");
    	   appointmentId = rs2.getInt("appointment_id");
       }
       
       
       if(gender.equals("male")) {
    	   patientName = "Mr. " + patientName;
       }
       else if(gender.equals("female")) {
    	   patientName = "Miss. " + patientName;
       }
       else if (gender.equals("female") && age > 26)
       {
    	   patientName = "Mrs. " + patientName;
       }
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Booked | HMS</title>
</head>

<style type="text/css">
	body {
		margin: 0;
	}

	* {
		box-sizing: border-box;
	}
	
	.heading p {
		text-align: center;
		font-size: 20px;
		font-weight: 1000;
		font-family: 'Courier New', monospace;
	}

	.details {
		padding: 5px 10px;
		margin-top: 2%;
	}

	.d1 {
		float: left;
		
		margin-left: 20%;
	}

	.d1 P{
		text-align: left;
		font-size: 16px;
		font-weight: 500;
	}

	.d2 {
		float: right;
		margin-right: 21%;
		
	}

	.d2 p{
		text-align: left;
		font-size: 16px;
		font-weight: 500;
	}

	.line hr {
		background-color: black;
		border-width: 0;
		height: 1px;
		margin-top: 13%;
		margin-left: 20%;
		margin-right: 20%;
	}

	.back a{
		display: block;
		text-align: center;
		text-decoration: none;
		margin-top: 5%;
		font-size: 16px;
		border: none;
		transition: color 0.34s ease;
		color: black;
	}

	.back a:hover {
		text-decoration: underline;
		color: black;
		font-weight: 1000;
	}
</style>
<body>
	<div class="heading">
		<p>Appointment Successfully Booked</p>
	</div>

	<div class="details">
		<div class="d1">
			<p>Patient Id: <%=patientId %></p>
			<p>Patient Name: <%=patientName %></p>
			<p>Age: <%=age %> years</p>
			<p>Gender: <%=gender %></p>
			<p>Contact: <%=contact %></p>
		</div>

		<div class="d2">
			<p>Appointment Id: <%=appointmentId %></p>
			<p>Appointment_date: <%=appiintmentDate %></p>
			<p>Check-up Type: <%=checkup_type %></p>
			<p>Address: <%=address %></p>
		</div>
	</div>

	<div class="line">
		<hr>
	</div>

	<div class="back">
		<a href="usermodule.jsp">Go Back</a>
	</div>
</body>
</html>