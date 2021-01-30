package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import com.tech.blog.entites.Category;
import com.tech.blog.entites.Post;
public class PostDao {

Connection con;
public PostDao(Connection con)
{
	this.con=con;	
}


public ArrayList<Category> getAllCategories()
{
ArrayList<Category>list=new ArrayList<Category>();

try {
	
	String q="select * from categories";
	Statement st=this.con.createStatement();
	ResultSet set=st.executeQuery(q);
	while(set.next())
	{
		int cid=set.getInt("cid");
		String name=set.getString("name");
		String descriptioon=set.getString("description");
   Category c=new Category(cid,name,descriptioon);
   list.add(c);
		
	}
	
	
	
	
	
	
	
} catch (Exception e) {
	
	e.printStackTrace();
	
}
	return list;
}
	
   public boolean savePost(Post p)
 {
boolean f=false;
try {
	
	String q="insert into posts(pTitile,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
	PreparedStatement pstmt=con.prepareStatement(q);
	pstmt.setString(1, p.getpTitle());
	pstmt.setString(2, p.getpContent());
	pstmt.setString(3, p.getpCode());
	pstmt.setString(4, p.getpPic());
	pstmt.setInt(5, p.getCatId());
	pstmt.setInt(6, p.getUserId());
	pstmt.executeUpdate();
	f=true;
}catch(Exception e)
{
	e.printStackTrace();
}

	  return f; 
	   
 }
   
   
// get all the posts
 public ArrayList<Post> getAllPosts() {

     ArrayList<Post> list = new ArrayList<>();
     //fetch all the post
     try {

         PreparedStatement p = con.prepareStatement("select * from posts");

         ResultSet set = p.executeQuery();

         while (set.next()) {

             int pid = set.getInt("pid");
             String pTitle = set.getString("pTitile");
             String pContent = set.getString("pContent");
             String pCode = set.getString("pCode");
             String pPic = set.getString("pPic");
             String date = set.getString("pDate");
             int catId = set.getInt("catId");
             int userId = set.getInt("userId");
             Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

             list.add(post);
         }

     } catch (Exception e) {
         e.printStackTrace();
     }
     return list;
 }
 public ArrayList<Post> getPostByCatId(int catId) {
	 ArrayList<Post> list = new ArrayList<>();
     //fetch all post by id
     //fetch all the post
     try {

         PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
         p.setInt(1, catId);
         ResultSet set = p.executeQuery();

         while (set.next()) {

             int pid = set.getInt("pid");
             String pTitle = set.getString("pTitle");
             String pContent = set.getString("pContent");
             String pCode = set.getString("pCode");
             String pPic = set.getString("pPic");
             String date = set.getString("pDate");

             int userId = set.getInt("userId");
             Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

             list.add(post);
         }

     } catch (Exception e) {
         e.printStackTrace();
     }
     return list;
 }
	
	
}
