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
 * Servlet implementation class AdminSearchPatientServlet
 */
@WebServlet("/AdminSearchPatientServlet")
public class AdminSearchPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		PatientBean pBean = new PatientBean();
		ArrayList<PatientBean> plist = null;
		
		
		try {
			Long contact = Long.parseLong(request.getParameter("mobilenumber"));
			
			plist = pBean.getPatientByContactOrId(contact);
			
			
		} catch (Exception e) {
			System.out.println("FROM ADMIN SEARCH PATIENT SERVLET >>>>>");
		}
		
		
		session.setAttribute("plist", plist);
		response.sendRedirect("adminSearchPatientView.jsp");
	}

}
