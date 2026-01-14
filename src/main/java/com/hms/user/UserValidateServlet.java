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
<<<<<<< HEAD
import com.hms.patientAppointment.AppointmentBean;
=======

>>>>>>> e06896c5d3b881a587992830e685134132707732

/**
 * Servlet implementation class UserValidateServlet
 */
@WebServlet("/UserValidateServlet")
public class UserValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD

	PrintWriter out = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		out = response.getWriter();
		response.setContentType("html/text");

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");

		if (LoginValidate.loginCustomer(userid, password)) {

			HttpSession oldSession = request.getSession(false);

			if (oldSession != null) {
				oldSession.invalidate();
			}

			

			// TO get user id by email
			
			Integer userId = 0;
			try {
				userId = UserBean.getUserByIdEmail(userid);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Integer activeAppointments = AppointmentBean.countActiveAppointments(userId);
			
			
			// to get user name by email
			String username = "";
			try {
				username = UserBean.getUserNameByemail(userid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			HttpSession newsession = request.getSession();
//			newsession.setAttribute("userSessionId", new Integer(userId));
//			newsession.setAttribute("currentUserId", new Integer(userId));
			newsession.setAttribute("currentUserName", username);
			newsession.setAttribute("userAccountId", new Integer(userId));
			newsession.setAttribute("userEmail", userid);
			newsession.setAttribute("activeUserAppointments", activeAppointments);

			System.out.println("USER ID:- " + userid + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("usermodule.jsp");
		}

		else {
			request.getSession().setAttribute("errorMessage", "Invalid username / password");
			response.sendRedirect("Userlogin.jsp");
		}

	}
}
=======
       
	PrintWriter out = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		response.setContentType("html/text");
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		if (LoginValidate.loginCustomer(userid, password)) {
			
			
			
			Cookie loginCookie = new Cookie("userId", userid);
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
			
			
			session.setAttribute("userSessionId", userid);
			
			System.out.println("USER ID:- " + userid + " IS LOGGED IN.\n\n\n");
			response.sendRedirect("usermodule.jsp");
		} 
		
		else {
			session.setAttribute("errorMessage", "Invalid username / password");
			response.sendRedirect("Userlogin.jsp");
		}
		
	}
}
	
	
>>>>>>> e06896c5d3b881a587992830e685134132707732
