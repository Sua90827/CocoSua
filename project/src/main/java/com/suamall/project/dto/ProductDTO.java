package com.suamall.project.dto;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class ProductDTO {
	    private int prdt_id;       
	    private int cate_id;
	    @NotNull
	    private String prdt_nm;
	    private String prdt_img;
	    @NotNull
	    private String prdt_title; 
	    @NotNull
	    private String prdt_content;  
	    private int prdt_color;    
	    @NotNull
	    private int prdt_price;
	    @NotNull
	    private int prdt_amount;    
	    private MultipartFile file;
};