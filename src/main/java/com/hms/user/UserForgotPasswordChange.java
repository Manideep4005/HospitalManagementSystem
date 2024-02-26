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

			String userEmail = UserForgotPasswordMailOtp.getUserEmail(userId);

			if (userEmail != null || !userEmail.equals("")) {
				Connection con = MySqlConnection.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("update user set password = ?, passwordchangedate = ? where userid = ?");
				pstmt.setString(1, password);
				pstmt.setTimestamp(2, stamp);
				pstmt.setInt(3, userId);

				int n = pstmt.executeUpdate();

				if (n > 0) {
					String from = "Sender Email";
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

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("userForgotPasswordChangeError", "Error Occured try again!");
			response.sendRedirect("Userlogin.jsp");
		}

	}

}
