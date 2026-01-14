package com.hms.user;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;
import com.hms.patientAppointment.AppointmentBean;

/**
 * Servlet implementation class UserDeleteAppointment
 */
@WebServlet("/UserDeleteAppointment")
public class UserDeleteAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		try {
			Integer userId = (Integer) session.getAttribute("userAccountId");

			Integer appointmentId = Integer.parseInt(request.getParameter("appid"));
			Integer patientId = Integer.parseInt(request.getParameter("pid"));
			
			
			
			
			
			System.out.println("FROM USER APPOINTEMNT HISTORY");
			System.out.println("USER ID: " + userId);
			System.out.println("APPOINTMEnT ID: " + appointmentId);
			System.out.println("PATIENT ID: " + patientId);
			
			

			PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement(
					"delete from appointment where appointment_id = ?");

			pstmt.setInt(1, appointmentId);

			int n = pstmt.executeUpdate();
//
			PreparedStatement pstmt1 = MySqlConnection.getConnection()
					.prepareStatement("delete from patient where patient_id = ?");
			pstmt1.setInt(1, patientId);

			int n1 = pstmt1.executeUpdate();

			if (n > 0 && n1 > 0 ) {
				Integer activeAppointemnts = AppointmentBean.countActiveAppointments(userId);
				session.setAttribute("activeUserAppointments", new Integer(activeAppointemnts));
				response.sendRedirect("UserAppointmentHistoryServlet");
			}

		} catch (Exception e) {
			System.out.println("FROM USER DELETE APPOINTMENT >>>>>>>>>\n");
			e.printStackTrace();
		}

	}

}
