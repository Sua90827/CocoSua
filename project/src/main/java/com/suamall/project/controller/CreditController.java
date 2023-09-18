package com.suamall.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.CreditInfoDTO;
import com.suamall.project.dto.orderInfoView.DeliveryInfoDTO;
import com.suamall.project.dto.orderInfoView.OrderListDTO;
import com.suamall.project.dto.orderInfoView.ProductOrderDTO;
import com.suamall.project.service.CreditService;

@Controller
public class CreditController {
@Autowired
CreditService service;
@Autowired
private HttpSession session;

	@PostMapping("creditInfo.do")
	public String creditInfoDo(CreditInfoDTO dto) {//장바구니
//		System.out.println("user_id====================================== => " + dto.getUser_id());
		System.out.println("prdt_id => " + dto.getPrdt_id());
		System.out.println("prdt_price => "+dto.getPrdt_price());
		System.out.println("amount => "+dto.getPrdt_amount());
//		System.out.println("credit_price => "+dto.getCredit_price());
//		System.out.println("credit_way=>"+dto.getCredit_way());
//		System.out.println("order_name=>"+dto.getOrder_nm());
//		System.out.println("phonenum=>"+dto.getOrder_phone_num());
//		System.out.println("email => "+dto.getOrder_email());
//		System.out.println("odersate=>"+dto.getOrder_state());
//		System.out.println("recipient name"+dto.getRecipient_nm());
//		System.out.println("recip phone num => "+dto.getRecipient_phone_num());
//		System.out.println("zipc ode=>"+dto.getRecipient_zip_code());
//		System.out.println("recipt addr=>"+dto.getRecipient_address());
//		System.out.println("adressssdetail => "+dto.getRecipient_address_detail());
//		System.out.println("recip memo=> "+dto.getRecipient_memo());
		
		//service.getCreditDate();
		
		service.insertCreditInfo(dto);
		
		//수량 없애는거 하고 싶으면 여기서 하면 됨.********************************************************************************************
		service.reducingPrdtAmount(dto); 
		
		service.updateDeleteCreditInfo(dto);
		
		return "user/payment/payment_success";
	}
	@GetMapping("orderList")
	public String orderList(CreditInfoDTO dto, Model model) {
		List<OrderListDTO> orderListDto = service.getOrderListById((String)session.getAttribute("user_id"));
		model.addAttribute("orderList", orderListDto);
		return "user/myPage/order_list";
	}
	
	@PostMapping("delivery.do")
	public String deliveryInfo(DeliveryInfoDTO dto ,Model model) {
		model.addAttribute("delivery", dto);
		return "user/myPage/delivery_info";
	}
}
