package com.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.catalina.User;

import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.userDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.Post;
import com.tech.blog.entites.user;
@MultipartConfig

public class AddPostServlet extends HttpServlet {

		
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.setContentType("text/html;charset=UTF-8");
			try { PrintWriter out = response.getWriter();
			 int cid = Integer.parseInt(request.getParameter("cid"));
	            String pTitle = request.getParameter("pTitle");
	            String pContent = request.getParameter("pContent");
	            String pCode = request.getParameter("pCode");
	            Part part = request.getPart("pic");
//	            getting currentuser id
	            HttpSession session = request.getSession();
	            user u = (user) session.getAttribute("currentUser");
	out.println("your post title is "+pTitle); 
	
	
	Post p=new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), "date", cid, u.getId()) ;
	PostDao dao=new PostDao(ConnectionProvider.getConnection2());
	if(dao.savePost(p))
	{
		out.print("done");
	}else 
	{
		out.print("error");
	}
	
	
	}catch(Exception e)
			{
		e.printStackTrace();
			}
		
			}

	
	
	
	
	
	
	
	
	
}
