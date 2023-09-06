package com.suamall.project.dto;

import lombok.Data;

@Data
public class PaymentDetailInfoDTO {
	int cart_id;
	String member_id;
	int prdt_id;
	String member_nm;
	String member_email;
	int member_birth;
	String member_phone_num;
	String member_zip_code;
	String member_address;
	String member_address_detail;
	String prdt_nm;
	String prdt_img;
	String prdt_title;
	String prdt_content;
	String prdt_color;
	int prdt_price;
	int cart_amount;
	int cart_price;
}
