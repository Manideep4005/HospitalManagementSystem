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
import com.hms.mailService.EmailSender;

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
		
		String query = "insert into doctor(doctor_firstname, doctor_lastname, gender, email, education, specialization, experience, address, contact) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement(query);
			pstmt.setString(1, dName1);
			pstmt.setString(2, dName2);
			pstmt.setString(3, gender);
			pstmt.setString(4, email);
			pstmt.setString(5, education);
			pstmt.setString(6, specialization);
			pstmt.setInt(7, experience);
			pstmt.setString(8, address);
			pstmt.setLong(9, mobile);
			
			int n = pstmt.executeUpdate();
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select doctor_id from doctor where doctor_firstname = ? and doctor_lastname = ? and email = ?");
			pstmt.setString(1, dName1);
			pstmt.setString(2, dName2);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			Integer doctorId = 0;
			
			while (rs.next()) {
				doctorId = rs.getInt("doctor_id");
			}
			
			String dName = dName1 + " " + dName2;
			
			
			HttpSession session = request.getSession();
			session.setAttribute("doctorLoginId", new Integer(doctorId));
			session.setAttribute("doctorName", dName);
			session.setAttribute("doctorPassword", email);
			session.setAttribute("doctorEmail", email);
			
			if (n > 0) {
<<<<<<< HEAD
				String from = "systems2hms@gmail.com";
=======
				String from = "Sender Email";
>>>>>>> e06896c5d3b881a587992830e685134132707732
				String subject = "Thank you for registering Dr. " + dName +" at Hospital Management System!";
				String to = session.getAttribute("adminEmail").toString();
				String adminName = (String)session.getAttribute("adminName");
				
				EmailSender mail = new EmailSender();
				boolean b = mail.doctorRegisterEmail(to, from, subject, adminName, doctorId, dName, email, "Doctor");
				
				if (b) {
				
				response.sendRedirect("adminDoctorConfirmation.jsp");
				}
				else {
					session.setAttribute("doctorRegisterError", "Error occured while sending mail!");
					response.sendRedirect("doctorregister.jsp");
				}
			
<<<<<<< HEAD
				System.out.println("New Doctor Registered Id:- " + doctorId + "\nAdmin Name :- " + dName + "\n\n");
=======
				System.out.println("New Doctor Registered Id:- " + doctorId + "\nDoctor Name :- " + dName + "\n\n");
>>>>>>> e06896c5d3b881a587992830e685134132707732
				
				
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
