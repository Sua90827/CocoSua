package com.suamall.project.dto;

import lombok.Data;

@Data
public class CartDTO {
	int cart_id;
	String user_id;
	int prdt_id;
	int cart_amount;
	int cart_price;
}
