<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMS</title>
<style type="text/css">

#back {
    	color: black;
    	border:none;
    	background-color: transparent;
    	font-size: 17px;
    	display: block;
    	margin-left: auto;
    	margin-right: auto;
    	margin-top: 1.5%;
    	font-weight: bolder;
    	cursor: pointer;
    	text-decoration: none;
    	transition:  0.34s ease;
    }
    
    #back:hover {
    	text-decoration: underline;
    }
</style>
</head>
<body>
	<h2>There is an error while processing your request</h2>
	<%=exception.toString() %>
	
	<div class="back">
		<form action="adminmodule.jsp" method="post">
			<button type="submit" id="back">Go Back</button>
		</form>
	</div>
	
</body>
</html>