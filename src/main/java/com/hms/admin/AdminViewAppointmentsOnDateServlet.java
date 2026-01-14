package com.hms.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.patientAppointment.AppointmentBean;
import com.mysql.cj.Session;

/**
 * Servlet implementation class AdminViewAppointmentsOnDateServlet
 */
@WebServlet("/AdminViewAppointmentsOnDateServlet")
public class AdminViewAppointmentsOnDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		AppointmentBean aBean = new AppointmentBean();
		ArrayList<AppointmentBean> alist = null;
		
		try {
			
			String appointment_date = request.getParameter("appdate");
			Date appDate = Date.valueOf(appointment_date);
			
			alist = aBean.getAppointmentsByDate(appDate);
					
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("dateList", alist);
		response.sendRedirect("adminViewAppointmentOnDate.jsp");
		
	}

	
}
