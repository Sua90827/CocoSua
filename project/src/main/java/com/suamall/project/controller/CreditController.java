package com.suamall.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.CreditInfoDTO;
import com.suamall.project.service.CreditService;

@Controller
public class CreditController {
@Autowired
CreditService service;

	@PostMapping("creditInfo.do")
	public String creditInfoDo(CreditInfoDTO dto) {//장바구니
		System.out.println("user_id => " + dto.getUser_id());
		System.out.println("prdt_id => " + dto.getPrdt_id());
		System.out.println("prdt_price => "+dto.getPrdt_price());
		System.out.println("amount => "+dto.getPrdt_amount());
		System.out.println("credit_price => "+dto.getCredit_price());
		System.out.println("credit_way=>"+dto.getCredit_way());
		System.out.println("order_name=>"+dto.getOrder_nm());
		System.out.println("phonenum=>"+dto.getOrder_phone_num());
		System.out.println("email => "+dto.getOrder_email());
		System.out.println("odersate=>"+dto.getOrder_state());
		System.out.println("recipient name"+dto.getRecipient_nm());
		System.out.println("recip phone num => "+dto.getRecipient_phone_num());
		System.out.println("zipc ode=>"+dto.getRecipient_zip_code());
		System.out.println("recipt addr=>"+dto.getRecipient_address());
		System.out.println("adressssdetail => "+dto.getRecipient_address_detail());
		System.out.println("recip memo=> "+dto.getRecipient_memo());
		
		//service.getCreditDate();
		
		service.insertCreditInfo(dto);
		service.updateDeleteCreditInfo(dto);
		
		return "user/payment/payment_success";
	}


}
