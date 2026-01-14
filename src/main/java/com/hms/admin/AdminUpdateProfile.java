package com.hms.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class AdminUpdateProfile
 */
@WebServlet("/AdminUpdateProfile")
public class AdminUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			
			Integer adminId = Integer.parseInt(request.getParameter("adminId"));
			String firstName = request.getParameter("first_name");
			String lastName = request.getParameter("last_name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			Long contact = Long.parseLong(request.getParameter("contact"));
			
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("update admin set admin_firstname = ?, admin_lastname = ?, gender = ?, email = ?, address = ?, contact = ? where admin_id = ?");
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, gender);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setLong(6, contact);
			pstmt.setInt(7, adminId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				session.setAttribute("adminUpdateSuccess", "Profile Updated Successfull.");
				
				AdminBean aBean = new AdminBean();
				ArrayList<AdminBean> aList = aBean.getAdminNameById(adminId);
				Iterator<AdminBean> itr = aList.iterator();
				
				String afname = "";
				String alname = "";
				
				while (itr.hasNext()) {
					 aBean = itr.next();
					
					afname = aBean.getFirstName();
					alname = aBean.getLastName();
				}
				
				session.setAttribute("adminName", afname + " " + alname);
				response.sendRedirect("admindetails.jsp");
			} else {
				session.setAttribute("adminUpdateError", "Error Occurred.");
				response.sendRedirect("admindetails.jsp");
			}

		} catch (Exception e) {
			session.setAttribute("adminUpdateError", "Error Occurred.");
			response.sendRedirect("admindetails.jsp");
			System.out.println(e);
			
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
