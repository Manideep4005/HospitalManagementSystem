package com.hms.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminForgotPasswordValidateOtp
 */
@WebServlet("/AdminForgotPasswordValidateOtp")
public class AdminForgotPasswordValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
		
		try {
			
			Integer adminId = (Integer)session.getAttribute("adminPasswordChangeAdminId");
			Integer otpSent = (Integer)session.getAttribute("adminPasswordChangeOtp");
			Integer otp = Integer.parseInt(request.getParameter("adminOtp"));
			
			System.out.println(otpSent);
			System.out.println(otp);
			
			if (otp.equals(otpSent)) {
				session.setAttribute("adminIdValidateOtp", adminId);
				session.removeAttribute("adminForgotOtpSentFail");
				response.sendRedirect("admin-forgotPasswordChange.jsp");
			} else {
				session.setAttribute("adminForgotOtpError", "Invalid otp.");
				session.removeAttribute("adminOtpSentMail");
				response.sendRedirect("admin-validatepasswordotp.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("adminForgotOtpError", "Error Occured at our side.");
			response.sendRedirect("user-validatepasswordotp.jsp");
		}
		
	}

}
