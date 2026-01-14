package com.hms.doctor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
<<<<<<< HEAD
=======
import javax.servlet.http.Cookie;
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
<<<<<<< HEAD

		Integer doctorId = Integer.parseInt(request.getParameter("doctorid"));

		String email = request.getParameter("doctoremail");

		
		if (LoginValidate.loginDoctor(doctorId, email)) {

			HttpSession oldSession = request.getSession(false);

			if (oldSession != null) {
				oldSession.invalidate();
			}
			
			String doctorName = DoctorsBean.getDoctorNameById(doctorId);
			String specialization = DoctorsBean.getDoctorSpecializationById(doctorId);
			
			HttpSession session = request.getSession();

			session.setAttribute("doctorSessionId", new Integer(doctorId));
			session.setAttribute("doctorAccountId", new Integer(doctorId));
			session.setAttribute("doctorAccountName", doctorName);
			session.setAttribute("doctorLogoutName", doctorName);
			session.setAttribute("doctorSepcialization", specialization);

			System.out.println("DOCTOR ID :- " + doctorId + "\nDoctor NAME :- " + doctorName + " IS LOGGED IN.\n\n\n");
=======
		
		Integer doctorId = Integer.parseInt(request.getParameter("doctorid"));
		
		String email = request.getParameter("doctoremail");

		if (LoginValidate.loginDoctor(doctorId, email)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("doctorSessionId", doctorId);

			System.out.println("DOCTOR ID :- " + doctorId + " IS LOGGED IN.\n\n\n");
>>>>>>> e06896c5d3b881a587992830e685134132707732
			response.sendRedirect("doctormodule.jsp");
		} else {
			request.setAttribute("doctorError", "Invalid Id / Email");
			RequestDispatcher rd = request.getRequestDispatcher("Doctorlogin.jsp");
			rd.forward(request, response);
		}
	}

}
