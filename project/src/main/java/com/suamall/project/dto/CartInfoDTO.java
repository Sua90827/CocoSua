package com.suamall.project.dto;

import lombok.Data;

@Data
public class CartInfoDTO {
	private int prdt_id;   
	private String user_id;
    private int cate_id;      
    private String prdt_nm;   
    private String prdt_img;
    private String prdt_title; 
    private String prdt_color;    
    private int prdt_price;  
    private String cate_nm;
    private String color_nm;
    private int cart_amount;
    private int cart_price;
}
