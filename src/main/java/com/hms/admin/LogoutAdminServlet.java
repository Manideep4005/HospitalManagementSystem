package com.hms.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutAdminServlet
 */
@WebServlet("/LogoutAdminServlet")
public class LogoutAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie Logincookie = null;
		
		
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("adminLogoutName");
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("adminId")) {
					Logincookie = cookie;
					System.out.println("Admin ID:- " + Logincookie.getValue() + "\nAdmin Name :- " + userName + "\nLogged out\n\n\n");
					break;
				}
			}
		}
		
		
		session.removeAttribute("adminGeneratedId");
		session.removeAttribute("adminValidateId");
		session.invalidate();
		
		
		if (Logincookie != null) {
			Logincookie.setMaxAge(0);
			response.addCookie(Logincookie);
		}
		response.sendRedirect("Adminlogin.jsp");
	}

}
