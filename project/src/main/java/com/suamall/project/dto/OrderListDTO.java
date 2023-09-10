package com.suamall.project.dto;

import java.util.List;

import lombok.Data;

@Data
public class OrderListDTO {
	private int credit_id;
	private String user_id;
	private List<ProductOrderDTO> productOrderDTO;
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
}
