package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.doctor.DoctorsBean;

/**
 * Servlet implementation class DisplaySpecificDoctorsServlet
 */
@WebServlet("/DisplaySpecificDoctorsServlet")
public class DisplaySpecificDoctorsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		DoctorsBean dct = new DoctorsBean();
    	ArrayList<DoctorsBean> dlist = null;
		
		try {
			
			String type = request.getParameter("doctorview");
			
			if (type.equals("all_list")) {
				dlist = dct.getDoctors();
			} else {
				dlist = dct.getDoctorBySpecialization(type);
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		session.setAttribute("dlist", dlist);
		response.sendRedirect("adminDisplayAllDoctor.jsp");
	}

}
