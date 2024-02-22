package com.hms.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		if (type.equals("all")) {
			request.setAttribute("specific", type);
			RequestDispatcher rd = request.getRequestDispatcher("userViewAllDoctor.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("specific", type);
			RequestDispatcher rd = request.getRequestDispatcher("userViewSpecificDoctor.jsp");
			rd.forward(request, response);
		}
		
		
		
	}

}
