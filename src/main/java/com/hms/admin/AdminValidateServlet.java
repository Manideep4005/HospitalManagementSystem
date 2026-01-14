package com.hms.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
<<<<<<< HEAD
=======
import javax.servlet.http.Cookie;
>>>>>>> e06896c5d3b881a587992830e685134132707732
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.LoginValidate;

/**
 * Servlet implementation class AdminValidateServlet
 */
@WebServlet("/AdminValidateServlet")
public class AdminValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrintWriter out = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		out = response.getWriter();
		response.setContentType("html/text");

<<<<<<< HEAD
		String email = request.getParameter("adminid");
		String password = request.getParameter("password");

		if (LoginValidate.loginAdmin(email, password)) {
			
			HttpSession oldSession = request.getSession(false);
			
			if (oldSession != null) {
				oldSession.invalidate();
			}
			
			
			Integer adminId = AdminBean.getAdminIdByEmail(email);
			
			String adminName = AdminBean.getAdminNameByEmail(email);
			
			System.out.println("ADMIN NAME FROM ADMIN VALIDATE SERVLET :- " + adminName);
			
			HttpSession newsession = request.getSession();
			
			
			
			newsession.setAttribute("adminValidateId", adminId);
			newsession.setAttribute("adminEmail", email);
			newsession.setAttribute("adminLogoutName", adminName);
			newsession.setAttribute("adminAccountId", new Integer(adminId));
			newsession.setAttribute("adminName", adminName);
			
=======
		Integer adminId = Integer.parseInt( request.getParameter("adminid"));
		String password = request.getParameter("password");

		if (LoginValidate.loginAdmin(adminId, password)) {
			
			
			HttpSession session = request.getSession();
			session.setAttribute("adminValidateId", adminId);
>>>>>>> e06896c5d3b881a587992830e685134132707732
			
			
			System.out.println("ADMIN ID :- " + adminId + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("adminmodule.jsp");
		}

		else {
			request.setAttribute("adminLoginError", "Invalid username / password");
			request.getRequestDispatcher("Adminlogin.jsp").forward(request, response);
		}

	}

}
