package com.hms.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class AdminRegisterServlet
 */
@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		
		
		String adminName;
		String adminfName = request.getParameter("adminfname");
		String adminlName = request.getParameter("adminlname");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Long contact = Long.parseLong(request.getParameter("mobilenumber"));
		
		adminName = adminfName + " " + adminlName;
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("insert into admin(admin_name, password, gender, email, address, contact) values (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, adminName);
			pstmt.setString(2, password);
			pstmt.setString(3, gender);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setLong(6, contact);
			
			int n = pstmt.executeUpdate();
			
			Integer adminId = 0;
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select admin_id from admin where admin_name = ? and email = ?");
			pstmt.setString(1, adminName);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adminId = rs.getInt("admin_id");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("adminLoginId", new Integer(adminId));
			
			session.setAttribute("adminLoginName", adminName);
			
			if (n > 0) {
				System.out.println("New User Registered Id:- " + adminId + "\nAdmin Name :- " + adminName + "\n\n");
				response.sendRedirect("adminLogin.jsp");
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("adminregisterError.jsp");
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
