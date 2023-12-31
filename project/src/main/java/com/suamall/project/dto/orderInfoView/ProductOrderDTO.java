package com.suamall.project.dto.orderInfoView;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class ProductOrderDTO {
	private int prdt_id;
    private int cate_id;      
    private String prdt_nm;   
    private String prdt_img;
    private String prdt_title; 
    private String prdt_color;    
    private int prdt_price;
    private int prdt_amount;
    private int review_check;
    private int display_status;
}
