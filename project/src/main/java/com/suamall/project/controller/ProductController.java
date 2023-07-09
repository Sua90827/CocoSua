package com.suamall.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.service.ProductService;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Controller
public class ProductController {
	@Autowired 
	private ProductService service;
	
	
	@GetMapping("/productList")
	public String productlist() {
		return "admin/product/product_list";
	}
	
	@GetMapping("/productInfo")
	public String productInfo() {
		return "admin/product/product_view";
	}
	
	@GetMapping("/productRegister")
	public String productRegister() {
		return "admin/product/product_register";
	}
	
	@GetMapping("/categoryRegister")
	public String categoryRegister() {
		return "admin/product/category_register";
	}
	
	@PostMapping("/categoryRegister.do")
	public String categoryRegister(CategoryDTO input) {
		String msg = service.cateNmMsg(input);
		
		return "admin/product/product_list";
	}
	

	
}
