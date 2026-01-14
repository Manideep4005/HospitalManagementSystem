package com.hms.admin;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.hms.db.MySqlConnection;
import com.hms.mailService.EmailSender;

/**
 * Servlet implementation class AdminRegisterServlet
 */
@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

    PreparedStatement pstmt = null;
    ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
<<<<<<< HEAD
		HttpSession session = request.getSession();
=======
		
>>>>>>> e06896c5d3b881a587992830e685134132707732
		
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
			pstmt = MySqlConnection.getConnection().prepareStatement("insert into admin(admin_firstname, admin_lastname, password, gender, email, address, contact) values (?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, adminfName);
			pstmt.setString(2, adminlName);
			pstmt.setString(3, password);
			pstmt.setString(4, gender);
			pstmt.setString(5, email);
			pstmt.setString(6, address);
			pstmt.setLong(7, contact);
			
			int n = pstmt.executeUpdate();
			
			Integer adminId = 0;
			
			pstmt = MySqlConnection.getConnection().prepareStatement("select admin_id from admin where admin_firstname = ? and admin_lastname = ? and email = ?");
			pstmt.setString(1, adminfName);
			pstmt.setString(2, adminlName);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adminId = rs.getInt("admin_id");
			}
			
<<<<<<< HEAD
			
			session.setAttribute("adminGeneratedId", new Integer(adminId));
			
			if (n > 0) {
				String from = "systems2hms@gmail.com";
=======
			HttpSession session = request.getSession();
			session.setAttribute("adminGeneratedId", new Integer(adminId));
			
			if (n > 0) {
				String from = "Sender Email";
>>>>>>> e06896c5d3b881a587992830e685134132707732
				String subject = "Thank you for registering as admin at Hospital Management System!";
				
				String adminEmailName = adminfName +" " + adminlName;
				
				EmailSender mail = new EmailSender();
				boolean b = mail.adminSendEmail(email, from, subject, adminId, adminEmailName, "Admin");
				
				if (b) {
<<<<<<< HEAD
				session.setAttribute("adminGeneratedId","Account Created");
=======
				session.setAttribute("adminGeneratedId","Please check your Email for Admin id.");
>>>>>>> e06896c5d3b881a587992830e685134132707732
				response.sendRedirect("Adminlogin.jsp");
				}
				else {
					session.setAttribute("adminRegisterError", "Error occured please try again!");
					response.sendRedirect("adminregister.jsp");
				}
			
				System.out.println("New User Registered Id:- " + adminId + "\nAdmin Name :- " + adminName + "\n\n");
			}
			
			
<<<<<<< HEAD
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e);
			session.setAttribute("adminRegisterError", "Email already exits in our database.");
			response.sendRedirect("adminregister.jsp");
		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("adminRegisterError", "An error occurred please Try again!");
			response.sendRedirect("adminregister.jsp");
=======
		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("adminregisterError.jsp");
>>>>>>> e06896c5d3b881a587992830e685134132707732
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
