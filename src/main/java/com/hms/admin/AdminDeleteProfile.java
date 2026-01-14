package com.hms.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class AdminDeleteProfile
 */
@WebServlet("/AdminDeleteProfile")
public class AdminDeleteProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("resource")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		PreparedStatement pstmt = null;
		Connection con = null;
		try {

			Integer adminId = (Integer) session.getAttribute("adminAccountId");

					con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("insert into admin_old select * from admin where admin_id = ?");
			pstmt.setInt(1, adminId);

			int n = pstmt.executeUpdate();

			if (n > 0) {
				pstmt = con.prepareStatement("delete from admin where admin_id = ?");
				pstmt.setInt(1, adminId);

				int m = pstmt.executeUpdate();

				if (m > 0) {
					session.removeAttribute("adminValidateId");
					session.removeAttribute("adminAccountId");
					session.invalidate();

					response.sendRedirect("Adminlogin.jsp");
				
				}
			}
			
			

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
			}
		}

	}

}
