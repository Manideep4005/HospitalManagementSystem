package com.hms.user;

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
 * Servlet implementation class UserValidateServlet
 */
@WebServlet("/UserValidateServlet")
public class UserValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserValidateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	PrintWriter out = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	
		out = response.getWriter();
		response.setContentType("html/text");
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		
		if (LoginValidate.loginCustomer(userid, password)) {
//			//HttpSession session = request.getSession();
//			//session.setAttribute("customerId", customerId);
//			//session.setMaxInactiveInterval(30*60);
//			
//			
			Cookie loginCookie = new Cookie("userId", userid);
//			Cookie loginUserNameCookie = new Cookie("userLoginName", userName);
			// setting cookie to expire in 60 minutes
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
//			response.addCookie(loginUserNameCookie);
			
////			rd = request.getRequestDispatcher("customermenu.jsp");
////			rd.forward(request, response);
			System.out.println("USER ID:- " + userid + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("usermodule.jsp");
		} 
		
		else {
			response.sendRedirect("userError.jsp");
		}
		
	}
}
	
	