package com.tech.blog.entites;

public class Category {

	private int cid;
	private String name;
	private String description;
	
	
	public Category(int cid ,String name, String description) {
		// TODO Auto-generated constructor stub
this.cid=cid;
this.description=description;
this.name=name;
	
	}
	public Category(String name, String description) {
		// TODO Auto-generated constructor stub
this.description=description;
this.name=name;
	
	}



	
	public Category() {
		// TODO Auto-generated constructor stub
	}




	public int getCid() {
		return cid;
	}




	public void setCid(int cid) {
		this.cid = cid;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getDescription() {
		return description;
	}




	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
