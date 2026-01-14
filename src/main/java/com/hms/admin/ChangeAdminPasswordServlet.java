package com.hms.admin;

import java.io.IOException;
import java.sql.PreparedStatement;
<<<<<<< HEAD
=======
import java.sql.ResultSet;
>>>>>>> e06896c5d3b881a587992830e685134132707732
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class ChangeAdminPasswordServlet
 */
@WebServlet("/ChangeAdminPasswordServlet")
public class ChangeAdminPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

<<<<<<< HEAD
		Integer adminId = (Integer) session.getAttribute("adminAccountId");
		String admin_new_password = request.getParameter("newpassword1");
		
		session.removeAttribute("adminPasswordError");
		
		AdminBean aBean = new AdminBean();
		
		PreparedStatement pstmt = null;

		try {

			String admin_current_password = aBean.getAdminPasswordById(adminId);
			

			if (admin_new_password.equals(admin_current_password)) {
=======
		Integer userId = (Integer) session.getAttribute("adminAccountId");
		String password1 = request.getParameter("newpassword1");

		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;

		try {

			String currentPassword = "";

			pstmt1 = MySqlConnection.getConnection().prepareStatement("select password from admin where admin_id = ?");
			pstmt1.setInt(1, userId);

			ResultSet rs = pstmt1.executeQuery();

			while (rs.next()) {
				currentPassword = rs.getString("password");
			}

			if (password1.equals(currentPassword)) {
>>>>>>> e06896c5d3b881a587992830e685134132707732
				session.setAttribute("adminPasswordError", "Password can't be same as old one.");
				response.sendRedirect("adminChangePassword.jsp");
			} else {
				pstmt = MySqlConnection.getConnection()
						.prepareStatement("update admin set password=? where admin_id = ?");
<<<<<<< HEAD
				pstmt.setString(1, admin_new_password);
				pstmt.setInt(2, adminId);
=======
				pstmt.setString(1, password1);
				pstmt.setInt(2, userId);
>>>>>>> e06896c5d3b881a587992830e685134132707732

				int n = pstmt.executeUpdate();

				if (n > 0) {
<<<<<<< HEAD
					response.sendRedirect("admindetails.jsp?success=Password Updated Succesfully");
=======
					response.sendRedirect("adminChangePasswordSuccess.jsp");
>>>>>>> e06896c5d3b881a587992830e685134132707732
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

}
