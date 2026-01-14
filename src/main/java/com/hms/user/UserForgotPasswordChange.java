package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;
import com.hms.mailService.EmailSender;

/**
 * Servlet implementation class UserForgotPasswordChange
 */
@WebServlet("/UserForgotPasswordChange")
public class UserForgotPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			Integer userId = Integer.parseInt(request.getParameter("userId"));
			String password = request.getParameter("password");

			Timestamp stamp = Timestamp.from(Instant.now());

<<<<<<< HEAD
			String userEmail = (String) session.getAttribute("userPasswordChangeUserEmail");
=======
			String userEmail = UserForgotPasswordMailOtp.getUserEmail(userId);
>>>>>>> e06896c5d3b881a587992830e685134132707732

			if (userEmail != null || !userEmail.equals("")) {
				Connection con = MySqlConnection.getConnection();
				PreparedStatement pstmt = con
<<<<<<< HEAD
						.prepareStatement("update user set password = ?, passwordchangedate = ? where userid = ? and email = ?");
				pstmt.setString(1, password);
				pstmt.setTimestamp(2, stamp);
				pstmt.setInt(3, userId);
				pstmt.setString(4, userEmail);
=======
						.prepareStatement("update user set password = ?, passwordchangedate = ? where userid = ?");
				pstmt.setString(1, password);
				pstmt.setTimestamp(2, stamp);
				pstmt.setInt(3, userId);
>>>>>>> e06896c5d3b881a587992830e685134132707732

				int n = pstmt.executeUpdate();

				if (n > 0) {
<<<<<<< HEAD
					String from = "systems2hms@gmail.com";
=======
					String from = "Sender Email";
>>>>>>> e06896c5d3b881a587992830e685134132707732
					String subject = "Password reset was successfull.";
					String to = userEmail;

					EmailSender mail = new EmailSender();
					boolean b = mail.userForgotPasswordEmailSucess(from, to, subject, stamp);

					if (b) {
						session.setAttribute("userPasswordChange", "Password changed success.");
						response.sendRedirect("Userlogin.jsp");
					}
				} else {
					session.setAttribute("userForgotPasswordChangeError", "Error Occured try again!");
					response.sendRedirect("Userlogin.jsp");
				}
			}
<<<<<<< HEAD
			
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("userForgotPasswordChangeError", "Error Occured try again!");
			response.sendRedirect("Userlogin.jsp");
		}
<<<<<<< HEAD
		
		if (session != null) {
			session.invalidate();
		}
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

	}

}
