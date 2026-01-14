package com.hms.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutDoctorServlet
 */
@WebServlet("/LogoutDoctorServlet")
public class LogoutDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String userName = (String) session.getAttribute("doctorLogoutName");

		
					System.out.println("Doctor ID:- " + session.getAttribute("doctorSessionId") +"\nDoctor Name :- Dr. " + userName
							+ "\nLogged out\n\n\n");
				

		
		session.removeAttribute("doctorSessionId");
		session.invalidate();

		response.sendRedirect("Doctorlogin.jsp");
	}

}
