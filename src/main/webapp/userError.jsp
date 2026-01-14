
<%@page isErrorPage="true" %>
<%@include file="userSessionValidate.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login | HMS</title>
<link rel="icon" type="image/png" href="CSS/HMSTITLE.jpg">

<style type="text/css">
	body {
		margin: 0;
/*        background-color: #734f96	;*/
		background-image: linear-gradient(to right, #9896f0, #fbc8d5);
	}
	
	form {
		
		margin-left: auto;
		margin-right: auto;
		width: 100px;
	}
	
	h1 {
		text-align:center;
	}
	
	button  {
		
		display: block;
		margin-left: auto;
		margin-right: auto;
		border:none;
		background-color: dodgerblue;
		padding: 15px;
		width: 100%;
		opacity: 0.8;
		cursor: pointer;
		font-size: 18px;
		color:white;
		font-weight: bolder;
		
	}
	
	button:hover {
		opacity: 1;
	}
    

    </style>
</head>
<body>
 	<h1>There is an error occurred try after sometime</h1>
 	<form action="usermodule.jsp" method="post">
 		<button type="submit">Back</button>
 	</form>
</body>
</html>
