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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminValidateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

PrintWriter out = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	
		out = response.getWriter();
		response.setContentType("html/text");
		
		String adminId = request.getParameter("adminid");
		String password = request.getParameter("password");
		
		
//		
		
		
		if (LoginValidate.loginAdmin(adminId, password)) {
//			//HttpSession session = request.getSession();
//			//session.setAttribute("customerId", customerId);
//			//session.setMaxInactiveInterval(30*60);
//			
//			
			Cookie loginCookie = new Cookie("adminId", adminId);
			
//			// setting cookie to expire in 60 minutes
			loginCookie.setMaxAge(60*60);
			response.addCookie(loginCookie);
			
////			rd = request.getRequestDispatcher("customermenu.jsp");
////			rd.forward(request, response);
			System.out.println("ADMIN ID :- " + adminId + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("adminmodule.jsp");
		} 
		
		else {
			response.sendRedirect("adminError.jsp");
		}
		
	}

}
