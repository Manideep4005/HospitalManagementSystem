<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-Cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // proxies

<<<<<<< HEAD
if (session.getAttribute("userAccountId") == null)
=======
if (session.getAttribute("userSessionId") == null)
>>>>>>> e06896c5d3b881a587992830e685134132707732
	response.sendRedirect("Userlogin.jsp");



%> 