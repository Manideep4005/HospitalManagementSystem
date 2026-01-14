package com.hms.user;

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
 * Servlet implementation class UserEditAppointment
 */
@WebServlet("/UserEditAppointment")
public class UserEditAppointment extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		
		ArrayList<AppointmentBean> aList = null;
		AppointmentBean aBean = new AppointmentBean();

		try {
			
			Integer userId = (Integer) session.getAttribute("userAccountId");
			
			Integer appointmentId = Integer.parseInt(request.getParameter("appid"));
			Integer patientId = Integer.parseInt(request.getParameter("pid"));
			
			System.out.println("FROM USER EDIT APPOINTMENT\n");
			System.out.println("USER ID: " + userId);
			System.out.println("APPOINTMENT ID: " + appointmentId);
			System.out.println("PATIENT ID: " + patientId);
			
			
			
			
			aList = aBean.getAppointmentsByAppointmentId(appointmentId);
			session.setAttribute("editAppointment", aList);
			response.sendRedirect("userEditAppointment.jsp");
			
			
			
			

		} catch (Exception e) {

			System.out.println("FROM USER EDIT APPOINTMENT TABLE >>>>>>>\n");
			e.printStackTrace();

		} finally {
			 
			 
		}

	}

}
