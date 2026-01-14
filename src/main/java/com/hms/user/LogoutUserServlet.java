package com.hms.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutUserServlet
 */
@WebServlet("/LogoutUserServlet")
public class LogoutUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie Logincookie = null;
		
		
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userLogoutName");
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userId")) {
					Logincookie = cookie;
					System.out.println("\n\nUser ID:- " + Logincookie.getValue() + "\nuser Name :- " + userName + "\nLogged out");
					break;
				}
			}
		}
		
		if (Logincookie != null) {
			Logincookie.setMaxAge(0);
			response.addCookie(Logincookie);
		}
		
		session.removeAttribute("userGeneratedId");
		
		session.removeAttribute("userSessionId");
		session.invalidate();
		
		
		
		response.sendRedirect("Userlogin.jsp");
	}

}
