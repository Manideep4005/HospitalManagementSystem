package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminViewAdminsServlet
 */
@WebServlet("/AdminViewAdminsServlet")
public class AdminViewAdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			AdminBean aBean = new AdminBean();
			ArrayList<AdminBean> aList = null;
			
			try {
				aList = aBean.getAdmins();
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			request.getSession().setAttribute("alist", aList);
			response.sendRedirect("adminViewAdmins.jsp");
			
	}

}
