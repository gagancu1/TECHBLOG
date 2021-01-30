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

public class loginServlet extends HttpServlet {

			
		//fetch usrname password 
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.setContentType("text/html;charset=UTF-8");
			try { PrintWriter out = response.getWriter();
		
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		userDao dao=new userDao(ConnectionProvider.getConnection2());
		
		user u=dao.getUserByEmailPass(userEmail, userPassword);
		
		 if (u == null) {
             //login.................
//             error///
//             out.println("Invalid Details..try again");
           Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);
			 response.sendRedirect("loginpage.jsp");
//out.print("Invalid Details ....try again");
           //  response.sendRedirect("loginpage.jsp");
         } else {
             //......
//             login success
             HttpSession s = request.getSession();
             s.setAttribute("currentUser", u);
             response.sendRedirect("profile.jsp");

         }		
		
		
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

	}
	
