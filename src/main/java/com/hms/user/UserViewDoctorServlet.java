package com.hms.user;

import java.io.IOException;
<<<<<<< HEAD
import java.util.ArrayList;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import com.hms.doctor.DoctorsBean;

=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
/**
 * Servlet implementation class UserViewDoctorServlet
 */
@WebServlet("/UserViewDoctorServlet")
public class UserViewDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserViewDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("doctorview");
		
<<<<<<< HEAD
		HttpSession session = request.getSession();
		
		DoctorsBean dBean = new DoctorsBean();
		ArrayList<DoctorsBean> dList = null;
		
		
		try {
			if (type.equals("all")) {
				dList = dBean.getDoctors();
				session.setAttribute("allDoctorsList", dList);
				response.sendRedirect("userViewAllDoctor.jsp");
			}
			else {
				dList = dBean.getDoctorBySpecialization(type);
				session.setAttribute("specificDoctorsList", dList);
				response.sendRedirect("userViewSpecificDoctor.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
=======
		if (type.equals("all")) {
			request.setAttribute("specific", type);
			RequestDispatcher rd = request.getRequestDispatcher("userViewAllDoctor.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("specific", type);
			RequestDispatcher rd = request.getRequestDispatcher("userViewSpecificDoctor.jsp");
			rd.forward(request, response);
>>>>>>> e06896c5d3b881a587992830e685134132707732
		}
		
		
		
	}

}
