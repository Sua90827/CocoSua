package com.suamall.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
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
	public String productRegister(Model model) {
		List<ColorDTO> color = service.getColorList();
		List<CategoryDTO> cate = service.getCategoryList();
		
		model.addAttribute("color", color);
		model.addAttribute("cate", cate);
		
		return "admin/product/product_register";
	}
	
	@GetMapping("/categoryRegister")
	public String categoryRegister() {
		return "admin/product/category_register";
	}
	
	@PostMapping("/categoryRegister.do")
	public String categoryRegister(CategoryDTO input, Model model) {
		String msg = service.cateNmMsg(input);
		if(msg!=null) {
			model.addAttribute("msg", msg);
			return "admin/product/category_register";
		}
		return "admin/product/product_list";
	}
}
