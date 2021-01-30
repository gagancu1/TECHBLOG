<%@page import="java.util.* ,java.io.* " %>
<%@page import="com.tech.blog.servlets.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<%@page import="com.tech.blog.entites.Post" %>
<%
PostDao d=new PostDao(ConnectionProvider.getConnection2());
List<Post> post=d.getAllPosts();

  for(Post p:post)  
  {
	  %>
	 <div class="col-md-6 mt-2">
	 <div class="card">
	
	 <div class="card-body">
	 
	   <b><%=p.getpTitle() %></b>
	   <p><%=p.getpContent() %></p>
	   <pre><%=p.getpCode() %></pre>
	 
	 </div>
	 </div>
	 
	 </div> 
	  
	 <%  
	  
  }

%>
