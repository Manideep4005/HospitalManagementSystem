package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminProfileDetails
 */
@WebServlet("/AdminProfileDetails")
public class AdminProfileDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer adminId = (Integer)session.getAttribute("adminAccountId");
		
		try {
			 if (adminId != null) {
				 AdminBean aBean = new AdminBean();
				 ArrayList<AdminBean> aList = aBean.getAdminById(adminId);
				 session.setAttribute("adminList", aList);
				 response.sendRedirect("admin-update-profile.jsp");
			 }
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		
	}

}
