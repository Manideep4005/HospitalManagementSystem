package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.CurrentDate;
import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PrintWriter out = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		out = response.getWriter();
		
		String userfname = request.getParameter("userfname");
		String userlname = request.getParameter("userlname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		Long contact = Long.parseLong(request.getParameter("mobilenumber"));
		Date date = CurrentDate.getCurrnetDate();
		
		String username = userfname + " " + userlname;
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("insert into user(username, password, email, gender, address, contact, join_date) values(?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, gender);
			pstmt.setString(5, address);
			pstmt.setLong(6, contact);
			pstmt.setDate(7, date);
			
			int n = pstmt.executeUpdate();
			
			Integer uId = 0;
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select userid from user where username = ? and email = ?");
			pstmt.setString(1, username);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				uId = rs.getInt("userid");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("userRegisterId", new Integer(uId));
			session.setAttribute("userRegisterName", username);
			
			if (n > 0) {
				System.out.println("Inserted into User table");
				response.sendRedirect("userRedirect.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
			out.println("There is an error while registration");
			RequestDispatcher rd = request.getRequestDispatcher("userregister.jsp");
			rd.include(request, response);
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
