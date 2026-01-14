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
 * Servlet implementation class AdminGetPatientServlet
 */
@WebServlet("/AdminGetPatientServlet")
public class AdminGetPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		PatientBean pBean = new PatientBean();
		
		ArrayList<PatientBean> plist = null;
		
		try {
			
			Integer patientId = Integer.parseInt(request.getParameter("patientid"));
			
			System.out.println(patientId);
			plist = pBean.getPatientById(patientId);
			System.out.println(plist.size());
		} catch (Exception e) {
			System.out.println("FROM ADMIN GET PATIENT SERVLET >>>>>>>");
		}
		
		
		session.setAttribute("getPatient", plist);
		response.sendRedirect("adminGetPatientDetails.jsp");
		
	}

}
