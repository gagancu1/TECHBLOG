package com.tech.blog.servlets;
import java.sql.*;
public class ConnectionProvider {
  //public Connection con;
	public static  Connection getConnection2(){
		 Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		//creating connection
		String url ="jdbc:mysql://localhost:3306/techblog";
		String username="root";
		String password="gagan";
		 	 con=DriverManager.getConnection(url,username,password);
		//
			} 
		
		catch(Exception e){

		e.printStackTrace();
		}
		return con;}
		

	}
