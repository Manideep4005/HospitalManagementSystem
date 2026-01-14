package com.hms.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserForgotPasswordValidateOtp
 */
@WebServlet("/UserForgotPasswordValidateOtp")
public class UserForgotPasswordValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
			
			Integer userId = (Integer)session.getAttribute("userPasswordChangeUserId");
<<<<<<< HEAD
			String email = (String)session.getAttribute("userPasswordChangeUserEmail");
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
			Integer otpSent = (Integer)session.getAttribute("userPasswordChangeOtp");
			Integer otp = Integer.parseInt(request.getParameter("otp"));
			
			System.out.println(otpSent);
			System.out.println(otp);
			
			if (otp.equals(otpSent)) {
				session.setAttribute("userIdValidateOtp", userId);
				response.sendRedirect("user-forgotPasswordChange.jsp");
			} else {
				session.setAttribute("userForgotOtpError", "Invalid otp.");
				response.sendRedirect("user-validatepasswordotp.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("userForgotOtpError", "Error Occured at our side.");
			response.sendRedirect("user-validatepasswordotp.jsp");
		}
		
	}
	
	public static void main(String[] args) {
		
	}

}
