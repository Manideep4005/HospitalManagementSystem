package com.hms.admin;

import java.io.IOException;
import java.sql.PreparedStatement;
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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAdminPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("adminAccountId");
		String password1 = request.getParameter("newpassword1");
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("update admin set password=? where admin_id = ?");
			pstmt.setString(1, password1);
			pstmt.setInt(2, userId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("adminChangePasswordSuccess.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
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
