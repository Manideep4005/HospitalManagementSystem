package com.hms.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			
			
			
			Integer userId = (Integer)session.getAttribute("userAccountId");
			
			UserBean aBean = new UserBean();
			
			ArrayList<UserBean> uList = null;
			
			try {
				 
					uList = aBean.getUserById(userId);
					session.setAttribute("userDetails", uList);
					response.sendRedirect("userdetails.jsp");
				 
			} catch (Exception e) {
				System.out.println("FROM USER PROFILE SERVLET >>>> " + e);
			}
			
			
	}

}
