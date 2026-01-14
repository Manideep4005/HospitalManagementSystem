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

<<<<<<< HEAD
		String userEmail = request.getParameter("userId");

		try {
			if (userEmail != null && !userEmail.equals("")) {

				if (UserBean.checkEmailExists(userEmail) >= 1) {

					Random random = new Random();
					Integer otp = random.nextInt(999999 - 1 + 1) + 1;

					String from = "systems2hms@gmail.com";
					String subject = "Reset your password for your user account";
					String to = userEmail;

					EmailSender mail = new EmailSender();
					boolean b = mail.userForgotPasswordEmail(from, to, subject, otp);

					if (b) {
						session.setAttribute("userPasswordChangeOtp", otp);
						session.setAttribute("userPasswordChangeUserEmail", userEmail);
						session.setAttribute("userPasswordChangeUserId", new Integer(getUserEmail(userEmail)));
						session.setAttribute("userOtpSentMail",
								"An otp was sent to " + userEmail + " if an account exists.");
						response.sendRedirect("user-validatepasswordotp.jsp");
					}

				} else {
					session.setAttribute("userOtpSentMail",
							"An otp was sent to " + userEmail + " if an account exists.");
					response.sendRedirect("user-validatepasswordotp.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("userOtpSentMail",
					"A mail was sent to " + userEmail + " with an otp if an account exists.");
			response.sendRedirect("user-validatepasswordotp.jsp");
=======
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
>>>>>>> e06896c5d3b881a587992830e685134132707732
		}

	}

	// helper function to get the user Email id
<<<<<<< HEAD
	public static Integer getUserEmail(String email) {

=======
	public static String getUserEmail(Integer userId) {

		String userEmail = "";
>>>>>>> e06896c5d3b881a587992830e685134132707732
		Integer userid = null;

		try {
			Connection con = MySqlConnection.getConnection();
<<<<<<< HEAD
			PreparedStatement pstmt = con.prepareStatement("select userid from user where email = ?");
			pstmt.setString(1, email);
=======
			PreparedStatement pstmt = con.prepareStatement("select userid, email from user where userid = ?");
			pstmt.setInt(1, userId);
>>>>>>> e06896c5d3b881a587992830e685134132707732

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				userid = rs.getInt("userid");
<<<<<<< HEAD
=======
				userEmail = rs.getString("email");
>>>>>>> e06896c5d3b881a587992830e685134132707732

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

<<<<<<< HEAD
		if (email != null && !email.equals(""))
			return userid;
		else
			return 0;
=======
		if (userid != null)
			return userEmail;
		else
			return "";
>>>>>>> e06896c5d3b881a587992830e685134132707732
	}

}
