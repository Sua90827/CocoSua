package com.suamall.project.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreditInfoDTO {
	private int credit_id;
	private String user_id;
	private String prdt_id; //split///
	private String prdt_price; //split
	private String prdt_amount; //split
	private int credit_price;
	private int credit_way;
	private String order_nm;
	private String order_phone_num;
	private String order_email;
	private String order_state;
	private String recipient_nm;
	private String recipient_phone_num;
	private String recipient_zip_code;
	private String recipient_address;
	private String recipient_address_detail;
	private String recipient_memo;
	private String credit_date;
	private String review_check;
}
