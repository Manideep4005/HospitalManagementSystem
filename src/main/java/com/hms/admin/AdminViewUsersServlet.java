package com.hms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.user.UserBean;

/**
 * Servlet implementation class AdminViewUsersServlet
 */
@WebServlet("/AdminViewUsersServlet")
public class AdminViewUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		UserBean uBean = new UserBean();
		ArrayList<UserBean> ulist = null;
		
		try {
			ulist = uBean.getUsers();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("ulist", ulist);
		response.sendRedirect("adminViewUsers.jsp");
	
	}

}
