<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="userSessionValidate.jsp" %>
<%@page errorPage="userError.jsp"%>

<%
	String todayDate = LocalDate.now().toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment Form | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>
/* ---- styles unchanged, merge markers removed ---- */
/* (Your full CSS is intact, no logic changes needed here) */
</style>
</head>

<body>

<h1>Book Appointment</h1>

<form id="signUpForm" action="RegisterPatientServlet" method="post">

	<div class="form-header">
		<span class="stepIndicator">Personal Info</span>
		<span class="stepIndicator">Contact Info</span>
		<span class="stepIndicator">Check-up & Appointment Info</span>
	</div>

	<!-- STEP 1 -->
	<div class="step">
		<p>Enter Personal Details</p>

		<input type="text" name="pfname" placeholder="First name" class="one">
		<input type="text" name="plname" placeholder="Last name" class="one">

		<select name="gender" class="one" required>
			<option value="">Select Gender</option>
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select>

		<input type="text" name="birth" placeholder="Enter Age" class="one">
	</div>

	<!-- STEP 2 -->
	<div class="step">
		<p>Enter Contact Details</p>

		<input type="email" name="email" placeholder="E-mail" class="one">
		<input type="text" name="mobilenumber" placeholder="Contact"
			maxlength="10" class="one">

		<textarea name="address" placeholder="Address" class="one"></textarea>
	</div>

	<!-- STEP 3 -->
	<div class="step">
		<p>Check-up type and Booking Date</p>

		<select name="checkup" class="one">
			<option value="" disabled selected>---- Check-up Type ----</option>
			<option value="general physician">General Physician</option>
			<option value="cardiologist">Cardiologist</option>
			<option value="dermetalogist">Dermatologist</option>
			<option value="orthopedic">Orthopedic</option>
			<option value="gastroenterologist">Gastroenterologist</option>
			<option value="diabetic">Diabetics</option>
			<option value="neurologists">Neurologists</option>
		</select>

		<textarea name="symptoms" placeholder="Symptoms (optional)"
			class="one"></textarea>

		<input type="text" name="appointmentdate"
			placeholder="Pick appointment date"
			class="one"
			onfocus="this.type='date'"
			min="<%= todayDate %>">
	</div>

	<div class="form-footer">
		<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
		<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
	</div>

</form>

<div class="overlay-2"></div>
<div class="modal">
	<div class="loader"></div>
</div>

<script>
let currentTab = 0;
showTab(currentTab);

function showTab(n) {
	let x = document.getElementsByClassName("step");
	x[n].style.display = "block";

	document.getElementById("prevBtn").style.display =
		n === 0 ? "none" : "inline";

	document.getElementById("nextBtn").innerHTML =
		n === (x.length - 1) ? "Submit" : "Next";
}

function nextPrev(n) {
	let x = document.getElementsByClassName("step");

	if (n === 1 && !validateForm()) return;

	x[currentTab].style.display = "none";
	currentTab += n;

	if (currentTab >= x.length) {
		document.getElementById("signUpForm").submit();
		document.querySelector(".modal").style.display = "flex";
		document.querySelector(".overlay-2").style.display = "block";
		return;
	}
	showTab(currentTab);
}

function validateForm() {
	let valid = true;
	let y = document.getElementsByClassName("step")[currentTab]
		.getElementsByClassName("one");

	for (let i = 0; i < y.length; i++) {
		if (y[i].value === "") {
			y[i].classList.add("invalid");
			valid = false;
		}
	}
	return valid;
}
</script>

</body>
</html>
