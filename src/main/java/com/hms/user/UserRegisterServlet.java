package com.hms.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
<<<<<<< HEAD
import java.sql.SQLIntegrityConstraintViolationException;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jakarta.activation.spi.*;

import com.hms.db.CurrentDate;
import com.hms.db.MySqlConnection;
import com.hms.mailService.EmailSender;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PrintWriter out = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		
		
		
		HttpSession session = request.getSession();
		
<<<<<<< HEAD
		String userfname = request.getParameter("userfname");
		String userlname = request.getParameter("userlname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		Long contact = Long.parseLong(request.getParameter("mobilenumber"));
		Date date = CurrentDate.getCurrnetDate();
		
		
		try {
			
			
=======
		try {
			
			
			String userfname = request.getParameter("userfname");
			String userlname = request.getParameter("userlname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			Long contact = Long.parseLong(request.getParameter("mobilenumber"));
			Date date = CurrentDate.getCurrnetDate();
>>>>>>> e06896c5d3b881a587992830e685134132707732
			
			
			
			pstmt = MySqlConnection.getConnection().prepareStatement("insert into user(first_name, last_name, password, email, gender, address, contact, join_date) values(?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, userfname);
			pstmt.setString(2, userlname);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setString(5, gender);
			pstmt.setString(6, address);
			pstmt.setLong(7, contact);
			pstmt.setDate(8, date);
			
			int n = pstmt.executeUpdate();
			
			Integer uId = 0;
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select userid from user where first_name = ? and last_name = ? and email = ?");
			pstmt.setString(1, userfname);
			pstmt.setString(2, userlname);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				uId = rs.getInt("userid");
			}
			
			
			session.setAttribute("userRegisterId", new Integer(uId));
			session.setAttribute("userRegisterName", userfname + " " + userlname);
			
			
			
			
			if (n > 0) {
				System.out.println("Inserted into User table");
				
				/* Setting a Email with user id */
				
<<<<<<< HEAD
				String from = "systems2hms@gmail.com";
=======
				String from = "Sender Email";
>>>>>>> e06896c5d3b881a587992830e685134132707732
				String subject = "Thank you for registering as user at Hospital Management System!";
				
				String userName = userfname +" " + userlname;
				
				EmailSender mail = new EmailSender();
				boolean b = mail.userSendEmail(email, from, subject, uId, userName, "User");
				
				if (b) {
<<<<<<< HEAD
				session.setAttribute("userGeneratedId","Account created");
=======
				session.setAttribute("userGeneratedId","Please check your Email for user id.");
>>>>>>> e06896c5d3b881a587992830e685134132707732
				response.sendRedirect("Userlogin.jsp");
				}
				else {
					session.setAttribute("userRegisterError", "Error occured please try again!");
					response.sendRedirect("userregister.jsp");
				}
			
			}
			 
<<<<<<< HEAD
		} catch (SQLIntegrityConstraintViolationException e) {
 
			session.setAttribute("userRegisterError", email + " already exists.");
			response.sendRedirect("userregister.jsp");
		} catch (Exception e) {
			session.setAttribute("userRegisterError", "Error Occurred please try again later!");
			response.sendRedirect("userregister.jsp");
		}
		 
		
=======
		} catch (Exception e) {
 
			session.setAttribute("userRegisterError", e);
			response.sendRedirect("userregister.jsp");
		}
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
