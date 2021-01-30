
package com.tech.blog.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.userDao;
import com.tech.blog.entites.user;

import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = response.getWriter();
				
				String check=request.getParameter("user_check");
				if(check==null) {
					out.println("box not checked");
				}
				else {
					String name=request.getParameter("user_name");
					String email=request.getParameter("user_email");
					
					String password=request.getParameter("user_password");
					//String about=request.getParameter("about");
					String gender=request.getParameter("gender");
					//create a user object
					user u=new user(name,email,password,gender);
					//create userDao object
					userDao dao=new userDao(ConnectionProvider.getConnection2());
					//dao.saveuser(u);
					if(dao.saveuser(u))
					{
					
//						out.print(name);
//						out.print(email);
//						out.print(password);
//						out.print(gender);
//						 out.println(ConnectionProvider.getConnection2());
						out.println("done");
						
						
					}else
					{
						out.println("error");
					}
					
				}
		}

	}