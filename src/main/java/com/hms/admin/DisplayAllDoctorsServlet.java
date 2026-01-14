package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;

import com.hms.doctor.DoctorsBean;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732

/**
 * Servlet implementation class DisplayAllDoctorsServlet
 */
@WebServlet("/DisplayAllDoctorsServlet")
public class DisplayAllDoctorsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	DoctorsBean dct = new DoctorsBean();
    	ArrayList<DoctorsBean> dlist = null;
    	
<<<<<<< HEAD
    	HttpSession session = request.getSession();

    	
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
    	try {
			dlist = dct.getDoctors();
		} catch (Exception e) {
			// TODO: handle exception
			response.sendError(456, e.toString());
		}
    	
<<<<<<< HEAD
    	session.setAttribute("dlist", dlist);
    	
    	response.sendRedirect("adminDisplayAllDoctor.jsp");
=======
    	request.setAttribute("dlist", dlist);
    	
    	RequestDispatcher rd = request.getRequestDispatcher("adminDisplayAllDoctor.jsp");
    	rd.forward(request, response);
>>>>>>> e06896c5d3b881a587992830e685134132707732
    }

}
