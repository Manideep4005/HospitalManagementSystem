package com.hms.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Integer userId = Integer.parseInt(request.getParameter("userId"));
			String fName = request.getParameter("first_name");
			String lName = request.getParameter("last_name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			Long mobile = Long.parseLong(request.getParameter("mobile"));

			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement(
					"update user set first_name = ?, last_name = ?, email = ?, gender = ?, address = ?, contact = ? where userid = ?");
			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, email);
			pstmt.setString(4, gender);
			pstmt.setString(5, address);
			pstmt.setLong(6, mobile);
			pstmt.setInt(7, userId);

			int n = pstmt.executeUpdate();

			if (n > 0) {
				session.setAttribute("userUpdateSucess", "Profile Updated Successfully.");
<<<<<<< HEAD
				session.setAttribute("currentUserName", fName + " " + lName);
				response.sendRedirect("UserProfileServlet");
=======
				response.sendRedirect("userdetails.jsp");
>>>>>>> e06896c5d3b881a587992830e685134132707732
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
