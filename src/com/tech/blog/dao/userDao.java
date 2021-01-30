package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entites.user;
public class userDao {
	private Connection con;
	public userDao(Connection con) {
		this.con=con;
		// TODO Auto-generated constructor stub
	}
	public userDao() {

		// TODO Auto-generated constructor stub
	}

	public boolean saveuser(user u) {
		boolean f=false;
		try {
		
		String query="insert into user(name,email,password,gender) values(?,?,?,?)";
		
		PreparedStatement pstmt=this.con.prepareStatement(query);
		
		pstmt.setString(1, u.getName());
		pstmt.setString(2, u.getEmail());
		pstmt.setString(3, u.getPassword());
		pstmt.setString(4, u.getGender());
		pstmt.executeUpdate();
		f=true;
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return  f;
	}
	
	public user getUserByEmailPass(String email,String password)
	{
		user User=null;
		
		
		try {
			
			String q="select * from user where email=? and password=?" ;
			
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,email);
			pst.setString(2, password);
			ResultSet set=pst.executeQuery();
			if(set.next())
			{
				User=new user();
				
				//data from db
				String name=set.getString("name");
				User.setName(name);
				User.setEmail(set.getString("email"));
				User.setGender(set.getString("gender"));
				User.setProfile(set.getString("profile"));
				
			
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return User;
		
	}
	
	
	
	
	
	
	
	
	
	

}
