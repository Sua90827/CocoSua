package com.suamall.project.dto;

public class WishListDTO {
	private int id;
	private String user_id;
	private int prdt_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPrdt_id() {
		return prdt_id;
	}
	public void setPrdt_id(int prdt_id) {
		this.prdt_id = prdt_id;
	}
	
}
