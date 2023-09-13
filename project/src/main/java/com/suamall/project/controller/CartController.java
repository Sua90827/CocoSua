package com.suamall.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.MemberDTO;
import com.suamall.project.dto.cartInfoView.CartInfoDTO;
import com.suamall.project.service.CartService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {
	private final CartService service;
	
	@GetMapping("/cart")
	public String cartInfo(@RequestParam("user_id") String user_id, Model model) {
		List<CartInfoDTO> result = service.getCartInfo(user_id);
		System.out.println(result.size());
		for(int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i).getPrdt_id());
		}
		model.addAttribute("cart", result);
		return "user/cart/cart_info";
	}
	
	@PostMapping("/cart.do")
	public String cartAdd(CartDTO dto) {
		service.cartAdd(dto);
		return "redirect:userPrdtInfo?prdt_id="+dto.getPrdt_id();
	}
	
	@GetMapping("/cartDelete")
	public String cartDelete(@RequestParam("user_id") String user_id, @RequestParam("prdt_id") int prdt_id) {
		System.out.println("prdt_id:"+prdt_id);
		System.out.println("user_id:"+user_id);
		service.delete(user_id, prdt_id);
		return "redirect:cart?user_id="+user_id;
	}
	
	@PostMapping("/paymentInfo")
	public String paymentInfo(@RequestParam("user_id") String user_id, 
								@RequestParam("cart_id") String cart_id,
								@RequestParam("cart_amount") String cart_amount, Model model) {
		MemberDTO dto = service.getUserInfo(user_id);
		List<CartInfoDTO> cart = service.getCartInfo(user_id);
//		for(int i = 0; i < cart.size(); i++) {
//			System.out.println(cart.get(i).getUser_id());
//			System.out.println(cart.get(i).getCart_price());
//		}
		cart=service.updateCart(cart,cart_id,cart_amount);
		model.addAttribute("member", dto);
		model.addAttribute("cart", cart);
		return "user/payment/payment_info";
	}
}
