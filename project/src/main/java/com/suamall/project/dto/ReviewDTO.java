package com.suamall.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewDTO {
	private int credit_id;
	private int index;
	private int review_no;//
	private int prdt_id;
	private String prdt_nm;
	private String prdt_color;
	private String prdt_title;
	private String user_id;
	private String title;
	private String content;
	private String save_date;//
	private int hit;//
	private String image_file_name;
	private MultipartFile file;
}

