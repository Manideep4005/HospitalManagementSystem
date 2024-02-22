package com.hms.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminAppointmentServlet
 */
@WebServlet("/AdminAppointmentServlet")
public class AdminAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("doctorview");
		
		if (type.equals("all")) {
			response.sendRedirect("adminAppointmentDetails.jsp");
		} 
		else {
			response.sendRedirect("adminAppointmentDetailsSpecific.jsp");
		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("Appointment_type", type);
	}

}
