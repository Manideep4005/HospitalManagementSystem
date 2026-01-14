package com.hms.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.MySqlConnection;

/**
 * Servlet implementation class UserUpdateAppointment
 */
@WebServlet("/UserUpdateAppointment")
public class UserUpdateAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		
		PreparedStatement pstmt = null;
		Connection con = null;

		try {

			Integer userId = (Integer) session.getAttribute("userAccountId");
			
			Integer patientId = Integer.parseInt(request.getParameter("pid"));
			Integer appointmentId = Integer.parseInt(request.getParameter("appid"));
			Integer age = Integer.parseInt(request.getParameter("age"));
			
			String gender = request.getParameter("gender");
			String pfName = request.getParameter("pfname");
			String lastName = request.getParameter("plname");

			String checkup = request.getParameter("checkup");
			String appointmateDateString = request.getParameter("appointmentdate");
			Date appointmentDate = Date.valueOf(appointmateDateString);

			String symptoms = request.getParameter("symptoms");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			Long contact = Long.parseLong(request.getParameter("contact"));
			
			
			System.out.println("\n\n\nFROM USER UPDATE PATIENT APPOINTMENT");
			System.out.println("USER ID: " + userId);
			System.out.println("PATIENT ID: " + patientId);
			System.out.println("AGE: " + age);
			System.out.println("GENDER: " + gender);
			System.out.println("FIRST NAME: " + pfName);
			System.out.println("LAST NAME: " + lastName);
			System.out.println("CHECK UP: " + checkup);
			System.out.println("APPOINTMENT DATE: " + appointmentDate);
			System.out.println("SYSMPTOMS: " + symptoms);
			System.out.println("EMAIL: " + email);
			System.out.println("CONTACT: " + contact + "\n\n\n");
			
			
			

			con = MySqlConnection.getConnection();

			pstmt = con.prepareStatement(
					"update appointment set patient_firstname = ?, patient_lastname = ?, checkup_type = ?, appointment_date = ?, contact = ?, symptoms = ?, email = ?, gender = ?, age = ?, address = ? where appointment_id = ? and patient_id = ? and user_id = ?");
			pstmt.setString(1, pfName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, checkup);
			pstmt.setDate(4, appointmentDate);
			pstmt.setLong(5, contact);
			pstmt.setString(6, symptoms);
			pstmt.setString(7, email);
			pstmt.setString(8, gender);
			pstmt.setInt(9, age);
			pstmt.setString(10, address);
			pstmt.setInt(11, appointmentId);
			pstmt.setInt(12, patientId);
			pstmt.setInt(13, userId);
			
			Timestamp timestamp = Timestamp.from(Instant.now());
			int n1 = updatePatient(patientId, pfName, lastName, gender, age, checkup, symptoms, email, address, contact, timestamp, userId);
			
			int n = pstmt.executeUpdate();
			
			
			
			
			
			
			if (n > 0 && n1 > 0) {
				response.sendRedirect("UserAppointmentHistoryServlet");
			}
			
			
		} catch (Exception e) {

			System.out.println("FROM USER UPDATE APPOINTMENT TABLE >>>>>>>\n");
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}
	
	
	
	
	
	
	public static int updatePatient(Integer patient_id, String fName, String lName, String gender, Integer age, String checkup, String symptoms, String email, String address, Long contact, Timestamp admitted_date ,Integer user_id) {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		int n = 0;
		
		try {
			
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("update patient set patient_firstname = ?, patient_lastname = ?, gender = ?, age = ?, checkup_type = ?, symptoms = ?, email = ?, address = ?, contact = ?, admitted_date = ? where patient_id = ? and user_id = ?");
			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, gender);
			pstmt.setInt(4, age);
			pstmt.setString(5, checkup);
			pstmt.setString(6, symptoms);
			pstmt.setString(7, email);
			pstmt.setString(8, address);
			pstmt.setLong(9, contact);
			pstmt.setTimestamp(10, admitted_date);
			pstmt.setInt(11, patient_id);
			pstmt.setInt(12, user_id);
			
			  n = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("\nFROM USER UPDATE PATIENT DETAILS >>>>>>>>>\n");
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		return n;
	}

}
