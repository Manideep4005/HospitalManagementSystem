package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.patientAppointment.AppointmentBean;

/**
 * Servlet implementation class AdminCurrentAppointments
 */
@WebServlet("/AdminCurrentAppointments")
public class AdminCurrentAppointments extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AppointmentBean aBean = new AppointmentBean();
		ArrayList<AppointmentBean> aList = null;

		try {
			// Today's date
			java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

			// Fetch only today's appointments
			aList = aBean.getAppointmentsByDate(today);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// Store in session as "appointments"
		HttpSession session = request.getSession();
		session.setAttribute("appointments", aList);

		response.sendRedirect("adminCurrentAppointments.jsp");
	}
}
