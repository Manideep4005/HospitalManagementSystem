package com.hms.doctor;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutDoctorServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		Cookie loginCookie = null;
		Cookie[] cookies = request.getCookies();
		
		HttpSession session = request.getSession();
		
		String userName = (String)session.getAttribute("doctorLogoutName");
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("doctorId")) {
					loginCookie = cookie;
					System.out.println("Doctor ID:- " + loginCookie.getValue() + "\nDoctor Name :- Dr. " + userName + "\nLogged out\n\n\n");
					break;
				}
			}
		}
		
//		HttpSession session = request.getSession(false);
//		System.out.println(session.getAttribute("username"));
//		if (session != null)
//			session.invalidate();
		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}
		response.sendRedirect("Doctorlogin.html");
	}
}
