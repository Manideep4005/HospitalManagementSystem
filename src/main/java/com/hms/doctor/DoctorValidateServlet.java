package com.hms.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.LoginValidate;

/**
 * Servlet implementation class DoctorValidateServlet
 */
@WebServlet("/DoctorValidateServlet")
public class DoctorValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorValidateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String doctorId = request.getParameter("doctorid");
		String email = request.getParameter("doctoremail");
		
		if (LoginValidate.loginDoctor(doctorId, email)) {
			Cookie loginCookie = new Cookie("doctorId", doctorId);
			
//			// setting cookie to expire in 60 minutes
			loginCookie.setMaxAge(60*60);
			response.addCookie(loginCookie);
			
////			rd = request.getRequestDispatcher("customermenu.jsp");
////			rd.forward(request, response);
			System.out.println("DOCTOR ID :- " + doctorId + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("doctormodule.jsp");
		}
		else {
			response.sendRedirect("doctorError.jsp");
		}
	}

}
