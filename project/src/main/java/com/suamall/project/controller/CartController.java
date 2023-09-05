package com.suamall.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CartDetailInfoDTO;
import com.suamall.project.dto.CartInfoDTO;
import com.suamall.project.dto.ProductListViewDTO;
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
}
