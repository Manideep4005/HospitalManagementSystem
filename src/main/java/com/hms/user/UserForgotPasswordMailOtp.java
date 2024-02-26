package com.hms.user;

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
 * Servlet implementation class UserForgotPasswordMail
 */
@WebServlet("/UserForgotPasswordMail")
public class UserForgotPasswordMailOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Integer userId = Integer.parseInt(request.getParameter("userId"));

		session.setAttribute("userForgotPasswordUserId", userId);

		try {
			String userEmail = getUserEmail(userId);
			if (userEmail != null && !userEmail.equals("")) {
				
				Random random = new Random();
				Integer otp = random.nextInt(999999 - 1 + 1) + 1;
				
				String from = "Sender Email";
				String subject = "Reset your password for your user account";
				String to = userEmail;

				EmailSender mail = new EmailSender();
				boolean b = mail.userForgotPasswordEmail(from, to, subject, otp);
				
				if (b) {
					session.setAttribute("userPasswordChangeOtp", otp);
					session.setAttribute("userPasswordChangeUserId", userId);
					session.setAttribute("userOtpSentMail", "An OTP was sent to your mail.");
					response.sendRedirect("user-validatepasswordotp.jsp");
				}

			} else {
				session.setAttribute("userForgotOtpSentFail", "No Account found with user id");
				response.sendRedirect("user-forgotpasswordotp.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("userForgotOtpSentFail", "No Account found with user id");
			response.sendRedirect("user-forgotpasswordotp.jsp");
		}

	}

	// helper function to get the user Email id
	public static String getUserEmail(Integer userId) {

		String userEmail = "";
		Integer userid = null;

		try {
			Connection con = MySqlConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select userid, email from user where userid = ?");
			pstmt.setInt(1, userId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				userid = rs.getInt("userid");
				userEmail = rs.getString("email");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (userid != null)
			return userEmail;
		else
			return "";
	}

}
