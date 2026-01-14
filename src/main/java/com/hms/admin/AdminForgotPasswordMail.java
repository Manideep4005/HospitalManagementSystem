package com.hms.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;
import com.hms.mailService.EmailSender;

/**
 * Servlet implementation class AdminForgotPasswordMail
 */
@WebServlet("/AdminForgotPasswordMail")
public class AdminForgotPasswordMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = request.getParameter("adminId");

		Integer adminId = AdminBean.getAdminIdByEmail(email);

		session.setAttribute("adminForgotPasswordAdminId", adminId);

		try {

			if (email != null && !email.equals("")) {

				if (AdminBean.checkEmailExists(email) >= 1) {

					Random random = new Random();
					Integer OTP = random.nextInt(999999 - 1 + 1) + 1;

					EmailSender mail = new EmailSender();
					boolean b = mail.adminForgotPasswordEmail(email, OTP);

					if (b) {
						session.setAttribute("adminPasswordChangeOtp", OTP);
						session.setAttribute("adminPasswordChangeAdminId", adminId);
						session.setAttribute("adminEmail", email);
						session.setAttribute("adminOtpSentMail",
								"An otp was sent to " + email + " if there is an account exists.");
						session.removeAttribute("adminForgotOtpError");
						response.sendRedirect("admin-validatepasswordotp.jsp");
					}
				}else {
				session.setAttribute("adminPasswordChangeAdminId", adminId);
				session.setAttribute("adminOtpSentMail",
						"An otp was sent to " + email + " if there is an account exists.");
				session.removeAttribute("adminForgotOtpError");
				response.sendRedirect("admin-validatepasswordotp.jsp");
			}

			} 

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("adminPasswordChangeAdminId", adminId);
			session.setAttribute("adminOtpSentMail", "An otp was sent to " + email + " if there is an account exists.");
			session.removeAttribute("adminForgotOtpError");
			response.sendRedirect("admin-validatepasswordotp.jsp");
		}
	}

=======
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Integer adminId = Integer.parseInt(request.getParameter("adminId"));
		session.setAttribute("adminForgotPasswordAdminId", adminId);
	
		try {
			
			String adminEmail = getAdminEmail(adminId);
			
			if (adminEmail != null && !adminEmail.equals("")) {
				Random random = new Random();
				Integer OTP = random.nextInt(999999 - 1 + 1) + 1;
				
				EmailSender mail = new EmailSender();
				boolean b = mail.adminForgotPasswordEmail(adminEmail, OTP);
				
				if (b) {
					session.setAttribute("adminPasswordChangeOtp", OTP);
					session.setAttribute("adminPasswordChangeAdminId", adminId);
					session.setAttribute("adminOtpSentMail", "An OTP was sent to your mail.");
					session.removeAttribute("adminForgotOtpError");
					response.sendRedirect("admin-validatepasswordotp.jsp");
				}
			}
			else {
				session.setAttribute("adminForgotOtpSentFail", "No Account found with Admin id");
				response.sendRedirect("admin-forgotpasswordotp.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("adminForgotOtpSentFail", "No Account found");
			response.sendRedirect("admin-forgotpasswordotp.jsp");
		}
	}

	// helper function to get the user Email id
		public static String getAdminEmail(Integer adminId) {

			String adminEmail = "";
			Integer admin_id = null;

			try {
				Connection con = MySqlConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select admin_id, email from admin where admin_id = ?");
				pstmt.setInt(1, adminId);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					admin_id = rs.getInt("admin_id");
					adminEmail = rs.getString("email");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			if (admin_id != null)
				return adminEmail;
			else
				return "";
		}
>>>>>>> e06896c5d3b881a587992830e685134132707732
}
