package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.patient.PatientBean;

/**
 * Servlet implementation class AdminViewPatientsServlet
 */
@WebServlet("/AdminViewPatientsServlet")
public class AdminViewPatientsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		ArrayList<PatientBean> plist = null;
		PatientBean pBean = new PatientBean();
		
		session.removeAttribute("patientCount");
		
		try {

			String department = request.getParameter("department");
			int count = pBean.getPatientCountByDepartment(department);

			if (department != null) {

				session.setAttribute("patientCount", count);

				plist = pBean.getPatientByDepartment(department);

				System.out.println("FROM ADMIN VIEW PATIENTS LIST SIZE :- " + count);

			} else {
				plist = pBean.getPatients();
			}
		} catch (Exception e) {
			System.out.println("FROM ADMIN VIEW PATIENTS SERVLET>>>>>>>");
		}

		session.setAttribute("plist", plist);

		response.sendRedirect("adminViewPatients.jsp");
	}

}
