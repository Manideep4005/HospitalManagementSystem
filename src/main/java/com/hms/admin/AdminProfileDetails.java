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
       
   
<<<<<<< HEAD
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer adminId = (Integer)session.getAttribute("adminAccountId");
		
		AdminBean aBean = new AdminBean();
		ArrayList<AdminBean> aList = null;
		
		try {
			 if (adminId != null) {
				 aList = aBean.getAdminById(adminId);
=======
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer adminId = (Integer)session.getAttribute("adminAccountId");
		
		try {
			 if (adminId != null) {
				 AdminBean aBean = new AdminBean();
				 ArrayList<AdminBean> aList = aBean.getAdminById(adminId);
>>>>>>> e06896c5d3b881a587992830e685134132707732
				 session.setAttribute("adminList", aList);
				 response.sendRedirect("admin-update-profile.jsp");
			 }
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		
	}

}
