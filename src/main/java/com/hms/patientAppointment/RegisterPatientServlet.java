package com.hms.patientAppointment;

import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.db.CurrentDate;
import com.hms.db.MySqlConnection;
import com.hms.mailService.EmailSender;

/**
 * Servlet implementation class RegisterPatientServlet
 */
@WebServlet("/RegisterPatientServlet")
public class RegisterPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

<<<<<<< HEAD
	PreparedStatement pstmt = null;
	ResultSet rs = null;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();

    String userEmail = session.getAttribute("userEmail").toString();
    String userName = session.getAttribute("currentUserName").toString();

    System.out.println("USER EMAIL FROM REGISTER PATIENT SERVLET " + userEmail);

    Timestamp timestamp = Timestamp.from(Instant.now());

    String pfname = request.getParameter("pfname");
    String plname = request.getParameter("plname");
    String gender = request.getParameter("gender");
    Integer age = Integer.parseInt(request.getParameter("birth"));
    String checkup = request.getParameter("checkup");
    String symptoms = request.getParameter("symptoms");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    Long contact = Long.parseLong(request.getParameter("mobilenumber"));
    Integer userId = (Integer) session.getAttribute("userAccountId");

    String appointmentDate = request.getParameter("appointmentdate");
    Date date = Date.valueOf(appointmentDate);

    String patientName = pfname + " " + plname;

    String query = "insert into patient(patient_firstname, patient_lastname, gender, age, checkup_type, symptoms, email, address, contact, admitted_date, user_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        pstmt = MySqlConnection.getConnection().prepareStatement(query);
        pstmt.setString(1, pfname);
        pstmt.setString(2, plname);
        pstmt.setString(3, gender);
        pstmt.setInt(4, age);
        pstmt.setString(5, checkup);
        pstmt.setString(6, symptoms);
        pstmt.setString(7, email);
        pstmt.setString(8, address);
        pstmt.setLong(9, contact);
        pstmt.setTimestamp(10, timestamp);
        pstmt.setInt(11, userId);

        int n = pstmt.executeUpdate();

        pstmt = MySqlConnection.getConnection().prepareStatement(
            "select patient_id from patient where patient_firstname= ? and patient_lastname = ? and Age=?"
        );
        pstmt.setString(1, pfname);
        pstmt.setString(2, plname);
        pstmt.setInt(3, age);

        rs = pstmt.executeQuery();

        Integer patientId = 0;
        while (rs.next()) {
            patientId = rs.getInt("patient_id");
        }
        session.setAttribute("userPatientId", patientId);

        pstmt = MySqlConnection.getConnection().prepareStatement(
            "insert into appointment(patient_id, patient_firstname, patient_lastname, checkup_type, appointment_date, contact, symptoms, email, gender, age, address, user_id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        );
        pstmt.setInt(1, patientId);
        pstmt.setString(2, pfname);
        pstmt.setString(3, plname);
        pstmt.setString(4, checkup);
        pstmt.setDate(5, date);
        pstmt.setLong(6, contact);
        pstmt.setString(7, symptoms);
        pstmt.setString(8, email);
        pstmt.setString(9, gender);
        pstmt.setInt(10, age);
        pstmt.setString(11, address);
        pstmt.setInt(12, userId);

        int n2 = pstmt.executeUpdate();

        Integer appointmentId = 0;
        pstmt = MySqlConnection.getConnection().prepareStatement("select appointment_id from appointment where patient_id= ?");
        pstmt.setInt(1, patientId);

        rs = pstmt.executeQuery();
        while (rs.next()) {
            appointmentId = rs.getInt("appointment_id");
        }
        session.setAttribute("userAppointmentId", appointmentId);

        if (n > 0 && n2 > 0) {
            //  Count appointments and set in session
            Integer activeAppointments = AppointmentBean.countActiveAppointments(userId);
            session.setAttribute("activeUserAppointments", activeAppointments);

            // Redirect immediately
            response.sendRedirect("userappointmentConfirm.jsp");

            //  Send email asynchronously in a new thread
            final Integer finalPatientId = patientId;
            final Integer finalAppointmentId = appointmentId;
            final String finalPatientName = patientName;
            final String finalUserEmail = userEmail;
            final String finalUserName = userName;

            new Thread(() -> {
                try {
                    EmailSender mail = new EmailSender();
                    String from = "systems2hms@gmail.com";
                    String subject = "Booking confirmation for Patient " + finalPatientName;
                    mail.appointmentSendEmail(
                        finalUserEmail, from, subject,
                        finalPatientId, finalPatientName, finalUserName, finalAppointmentId
                    );
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }).start();
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
=======
	
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userEmail = session.getAttribute("userEmail").toString();
		String userName = session.getAttribute("currentUserName").toString();
		
		Timestamp timestamp = Timestamp.from(Instant.now());
		
		String patientName;
		String pfname = request.getParameter("pfname");
		String plname = request.getParameter("plname");
		String gender = request.getParameter("gender");
		Integer age = Integer.parseInt(request.getParameter("birth"));
		String checkup = request.getParameter("checkup");
		String symptoms = request.getParameter("symptoms");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Long contact = Long.parseLong(request.getParameter("mobilenumber"));
		Integer  userId = (Integer)session.getAttribute("userAccountId");
		
		String appointmentDate = request.getParameter("appointmentdate");
		Date date = Date.valueOf(appointmentDate);
		
		
		patientName = pfname + " " + plname;
		
		
		String query = "insert into patient(patient_firstname, patient_lastname, gender, age, checkup_type, symptoms, email, address, contact, admitted_date, user_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement(query);
			pstmt.setString(1, pfname);
			pstmt.setString(2, plname);
			pstmt.setString(3, gender);
			pstmt.setInt(4, age);
			pstmt.setString(5, checkup);
			pstmt.setString(6, symptoms);
			pstmt.setString(7, email);
			pstmt.setString(8, address);
			pstmt.setLong(9, contact);
			pstmt.setTimestamp(10, timestamp);
			pstmt.setInt(11, userId);
			
			
			int n = pstmt.executeUpdate();
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select patient_id from patient where patient_firstname= ? and patient_lastname = ? and Age=?");
			pstmt.setString(1, pfname);
			pstmt.setString(2, plname);
			pstmt.setInt(3, age);
			
			rs = pstmt.executeQuery();
			
			Integer patientId = 0;
			
			while (rs.next()) {
				patientId = rs.getInt("patient_id");
			}
			
			session.setAttribute("userPatientId", new Integer(patientId));
			
			pstmt = MySqlConnection.getConnection().prepareStatement("insert into appointment(patient_id, patient_firstname, patient_lastname, checkup_type, appointment_date, user_id) values(?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, patientId);
			pstmt.setString(2, pfname);
			pstmt.setString(3, plname);
			pstmt.setString(4, checkup);
			pstmt.setDate(5, date);
			pstmt.setInt(6, userId);
			
			int n2 = pstmt.executeUpdate();
			
			
			Integer appointmentId = 0;
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select appointment_id from appointment where patient_id= ?");
			pstmt.setInt(1, patientId);
						
			while (rs.next()) {
				appointmentId = rs.getInt("appointment_id");
			}
			
			session.setAttribute("userAppointmentId", new Integer(appointmentId));
			
			
			if (n > 0 && n2 > 0) {
				EmailSender mail = new EmailSender();
				
				String from = "Sender Email";
				String subject = "Booking confirmation for Patient " + patientName;
				
				boolean b = mail.appointmentSendEmail(userEmail, from, subject, patientId, patientName, userName);
				if(b) {
				response.sendRedirect("userappointmentConfirm.jsp");
				
				} 
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("appointmentError.jsp");
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

>>>>>>> e06896c5d3b881a587992830e685134132707732
}
