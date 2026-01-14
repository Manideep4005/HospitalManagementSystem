package com.hms.admin;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class AdminDeleteDoctorServlet
 */
@WebServlet("/AdminDeleteDoctorServlet")
public class AdminDeleteDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Integer doctor_id = Integer.parseInt(request.getParameter("doctorid"));
			
			PreparedStatement pstmt = MySqlConnection.getConnection().prepareStatement("delete from doctor where doctor_id = ?");
			pstmt.setInt(1, doctor_id);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("DisplayAllDoctorsServlet");
			}
			
		} catch (Exception e) {
			System.out.println("FROM ADMIN DELETE DOCTOR SERVLET");
		}
		
	}

}
