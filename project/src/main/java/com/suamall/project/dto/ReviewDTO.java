package com.suamall.project.dto;

import lombok.Data;

@Data
public class ReviewDTO {
	private int review_no;
	private int prdt_id;
	private String prdt_nm;
	private String prdt_color;
	private String prdt_title;
	private String user_id;
	private String title;
	private String content;
	private String save_date;
	private int hit;
	private String image_file_name;
}

