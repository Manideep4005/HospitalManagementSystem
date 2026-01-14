package com.hms.admin;

import java.io.IOException;
<<<<<<< HEAD
import java.util.ArrayList;

=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import com.hms.patientAppointment.AppointmentBean;

=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
/**
 * Servlet implementation class AdminAppointmentServlet
 */
@WebServlet("/AdminAppointmentServlet")
public class AdminAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AppointmentBean aBean = new AppointmentBean();

		ArrayList<AppointmentBean> aList = null;
		
		
		try {

			String department = request.getParameter("doctorview");

			if (department != null) {
				aList = aBean.getAppointmentsDepartment(department);
			} else {
				aList = aBean.getAllAppointments();
			}
			
			System.out.println("FROM ADMIN APPOINTMENT SERVLET >>>> " + department);
			System.out.println(department == null);

		} catch (Exception e) {
			// TODO: handle exception
		}

		HttpSession session = request.getSession();
		session.setAttribute("appointmentsByDepartment", aList);
		
		response.sendRedirect("adminAppointmentDetails.jsp");
		
=======
       
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
	}

}
