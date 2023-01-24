package com.hms.user;

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
 * Servlet implementation class ChangeUserPasswordServlet
 */
@WebServlet("/ChangeUserPasswordServlet")
public class ChangeUserPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userAccountId");
		String password1 = request.getParameter("newpassword1");
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("update user set password=? where userid = ?");
			pstmt.setString(1, password1);
			pstmt.setInt(2, userId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("userChangePasswordSuccess.jsp");
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
