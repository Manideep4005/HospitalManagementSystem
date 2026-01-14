package com.hms.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class AdminDeletePatientServlet
 */
@WebServlet("/AdminDeletePatientServlet")
public class AdminDeletePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		PreparedStatement pstmt = null;
		Connection con = null;
			
		try {
			
			Integer patientid = Integer.parseInt(request.getParameter("patientid"));
			
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("delete from patient where patient_id = ?");
			pstmt.setInt(1, patientid);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("AdminViewPatientsServlet");
			}
			
		} catch (Exception e) {
			System.out.println("FROM AMDIN DELETE PATIENT SERVLET >>>>>");
		}
		
	}

}
