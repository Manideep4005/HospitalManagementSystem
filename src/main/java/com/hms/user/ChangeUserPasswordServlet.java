package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.CurrentDate;
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
		PreparedStatement pstmt1 = null;
		PrintWriter out = response.getWriter();
		
		
    	
    	 
		
    	Timestamp stamp = Timestamp.from(Instant.now());
    	
    	
		
		try {
			pstmt1 = MySqlConnection.getConnection().prepareStatement("select password from user where userid = ?");
			pstmt1.setInt(1, userId);
			
			ResultSet rs = pstmt1.executeQuery();
			
			String pass = "";
			
			while (rs.next()) {
				pass = rs.getString("password");
			}
			
			if (password1.equals(pass)) {
				
				request.setAttribute("errorPassword", "Password can't be same as old one!");
				request.getRequestDispatcher("userChangePassword.jsp").forward(request, response);
			} else {
				pstmt = MySqlConnection.getConnection().prepareStatement("update user set password=?, passwordchangedate=? where userid = ?");
				pstmt.setString(1, password1);
				pstmt.setTimestamp(2, stamp);
				pstmt.setInt(3, userId);
				
				
				int n = pstmt.executeUpdate();
				
				
				
				
				
		    	
				
				if (n > 0) {
					session.setAttribute("passwordChangeSuccessUser", "password changed successfully.");
<<<<<<< HEAD
					response.sendRedirect("UserProfileServlet");
=======
					response.sendRedirect("userdetails.jsp");
>>>>>>> e06896c5d3b881a587992830e685134132707732
				}
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
