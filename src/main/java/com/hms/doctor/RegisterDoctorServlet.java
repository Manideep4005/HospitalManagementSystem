package com.hms.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class RegisterDoctorServlet
 */
@WebServlet("/RegisterDoctorServlet")
public class RegisterDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	PreparedStatement pstmt = null;
	PrintWriter out = null;
	ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html/text");
		
		out = response.getWriter();
		
		String dName1 = request.getParameter("doctorfname");
		String dName2 = request.getParameter("doctorlname");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		Long mobile = Long.parseLong(request.getParameter("mobilenumber"));
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String specialization = request.getParameter("specialization");
		Integer experience = Integer.parseInt(request.getParameter("experience"));
		
		String query = "insert into doctor(doctor_name, gender, email, education, specialization, experience, address, contact) values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		String dName = dName1 + " " + dName2;
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement(query);
			pstmt.setString(1, dName);
			pstmt.setString(2, gender);
			pstmt.setString(3, email);
			pstmt.setString(4, education);
			pstmt.setString(5, specialization);
			pstmt.setInt(6, experience);
			pstmt.setString(7, address);
			pstmt.setLong(8, mobile);
			
			int n = pstmt.executeUpdate();
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select doctor_id from doctor where doctor_name = ? and email = ?");
			pstmt.setString(1, dName);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			Integer doctorId = 0;
			
			while (rs.next()) {
				doctorId = rs.getInt("doctor_id");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("doctorLoginId", new Integer(doctorId));
			session.setAttribute("doctorName", dName);
			session.setAttribute("doctorPassword", email);
			
			if (n > 0) {
				response.sendRedirect("adminDoctorConfirmation.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
