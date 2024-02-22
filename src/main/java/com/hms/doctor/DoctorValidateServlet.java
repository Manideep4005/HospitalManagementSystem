package com.hms.doctor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.LoginValidate;

/**
 * Servlet implementation class DoctorValidateServlet
 */
@WebServlet("/DoctorValidateServlet")
public class DoctorValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer doctorId = Integer.parseInt(request.getParameter("doctorid"));
		
		String email = request.getParameter("doctoremail");

		if (LoginValidate.loginDoctor(doctorId, email)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("doctorSessionId", doctorId);

			System.out.println("DOCTOR ID :- " + doctorId + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("doctormodule.jsp");
		} else {
			request.setAttribute("doctorError", "Invalid Id / Email");
			RequestDispatcher rd = request.getRequestDispatcher("Doctorlogin.jsp");
			rd.forward(request, response);
		}
	}

}
