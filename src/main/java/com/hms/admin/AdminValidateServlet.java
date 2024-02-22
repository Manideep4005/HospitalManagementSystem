package com.hms.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

		Integer adminId = Integer.parseInt( request.getParameter("adminid"));
		String password = request.getParameter("password");

		if (LoginValidate.loginAdmin(adminId, password)) {
			
			
			HttpSession session = request.getSession();
			session.setAttribute("adminValidateId", adminId);
			
			
			System.out.println("ADMIN ID :- " + adminId + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("adminmodule.jsp");
		}

		else {
			request.setAttribute("adminLoginError", "Invalid username / password");
			request.getRequestDispatcher("Adminlogin.jsp").forward(request, response);
		}

	}

}
