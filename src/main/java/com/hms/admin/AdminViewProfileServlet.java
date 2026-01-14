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
 * Servlet implementation class AdminViewProfileServlet
 */
@WebServlet("/AdminViewProfileServlet")
public class AdminViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		AdminBean aBean = new AdminBean();
		ArrayList<AdminBean> aList = null;
		
		try {
			
			Integer adminId = (Integer) session.getAttribute("adminAccountId");
			
			
			
			aList = aBean.getAdminById(adminId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		session.setAttribute("adminData", aList);
		
		response.sendRedirect("admindetails.jsp");
		
	
	}

}
