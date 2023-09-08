package com.suamall.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	@GetMapping("kakao_payment")
	public String kakaoPay(){
		return "user/payment/kakao_payment";
	}
}
