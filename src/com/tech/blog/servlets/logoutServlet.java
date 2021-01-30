package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.userDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.user;

public class logoutServlet extends HttpServlet {

			
	private static final long serialVersionUID = 1L;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("text/html;charset=UTF-8");
			try { PrintWriter out = response.getWriter();
			HttpSession s=request.getSession();
			s.removeAttribute("currentUser");
	       Message m=new Message("Logout Successfully","success" ,"alert-success" );
	       s.setAttribute("msg", m);
	       response.sendRedirect("loginpage.jsp");
	       
			
			
			}
			
			catch(Exception e)
			{
				
		
          	}

}
}