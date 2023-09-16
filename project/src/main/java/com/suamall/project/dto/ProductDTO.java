package com.suamall.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class ProductDTO {
	    private int prdt_id;       
	    private int cate_id;
	    private String prdt_nm;
	    private String prdt_img;
	    private String prdt_title; 
	    private String prdt_content;  
	    private int prdt_color;    
	    private int prdt_price;
	    private int prdt_amount;
	    private MultipartFile file;
};