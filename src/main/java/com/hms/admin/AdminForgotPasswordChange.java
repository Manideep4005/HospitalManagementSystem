package com.hms.admin;

import java.io.IOException;
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
 * Servlet implementation class AdminForgotPasswordChange
 */
@WebServlet("/AdminForgotPasswordChange")
public class AdminForgotPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
<<<<<<< HEAD
			String password = request.getParameter("password");
			
			Integer adminId = (Integer)session.getAttribute("adminPasswordChangeAdminId");
			
			Timestamp stamp = Timestamp.from(Instant.now());

			String adminEmail = (String) session.getAttribute("adminEmail");
=======
			Integer adminId = Integer.parseInt(request.getParameter("adminId"));
			String password = request.getParameter("password");

			Timestamp stamp = Timestamp.from(Instant.now());

			String adminEmail = AdminForgotPasswordMail.getAdminEmail(adminId);
>>>>>>> e06896c5d3b881a587992830e685134132707732

			if (adminEmail != null || !adminEmail.equals("")) {
				Connection con = MySqlConnection.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("update admin set password = ? where admin_id = ?");
				pstmt.setString(1, password);
				pstmt.setInt(2, adminId);

				int n = pstmt.executeUpdate();

				if (n > 0) {
					
					String to = adminEmail;

					EmailSender mail = new EmailSender();
					boolean b = mail.adminForgotPasswordEmailSucess(to, stamp);

					if (b) {
						System.out.println("Mail Sent");
					}
					session.setAttribute("adminPasswordChange", "Password changed success.");
					response.sendRedirect("Adminlogin.jsp");
				} else {
					session.setAttribute("adminForgotPasswordChangeError", "Error Occured try again!");
					response.sendRedirect("Adminlogin.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("adminForgotPasswordChangeError", "Error Occured try again!");
			response.sendRedirect("Adminlogin.jsp");
		}
	}

}
