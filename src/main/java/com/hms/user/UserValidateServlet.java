package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.LoginValidate;


/**
 * Servlet implementation class UserValidateServlet
 */
@WebServlet("/UserValidateServlet")
public class UserValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PrintWriter out = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		response.setContentType("html/text");
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		if (LoginValidate.loginCustomer(userid, password)) {
			
			
			
			Cookie loginCookie = new Cookie("userId", userid);
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
			
			
			session.setAttribute("userSessionId", userid);
			
			System.out.println("USER ID:- " + userid + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("usermodule.jsp");
		} 
		
		else {
			session.setAttribute("errorMessage", "Invalid username / password");
			response.sendRedirect("Userlogin.jsp");
		}
		
	}
}
	
	