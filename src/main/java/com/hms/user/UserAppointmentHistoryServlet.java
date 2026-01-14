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
 * Servlet implementation class UserAppointmentHistoryServlet
 */
@WebServlet("/UserAppointmentHistoryServlet")
public class UserAppointmentHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userAccountId");
		
		ArrayList<AppointmentBean> aList = null;
		AppointmentBean aBean = new AppointmentBean();
		
		try {
			aList = aBean.getAppointmentsByUserId(userId);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	
		session.setAttribute("userAppointments", aList);
		response.sendRedirect("userAppointmentHistory.jsp");
	}

}
