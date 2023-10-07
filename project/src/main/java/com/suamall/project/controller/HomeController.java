package com.suamall.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.service.HomeService;

import lombok.RequiredArgsConstructor;

@Controller 
@RequiredArgsConstructor
public class HomeController {
	
	private final HomeService service;
	
	@GetMapping("/")
	public String user(Model model) {
		List<ProductDTO> dto = service.selectMini();
		List<CategoryDTO> cate = service.selectCate();
		//System.out.println(cate.get(0).getCate_nm());
		model.addAttribute("prdt", dto);
		model.addAttribute("cate", cate);
		return "user/index";
	}
	
	@GetMapping("/admin")
	public String admin(HttpSession session) {

		try {
			int loginTypeSession = (int) session.getAttribute("loginType");
			if(loginTypeSession!=2) {
				return "redirect:/";
			}
		}catch(NullPointerException e) {
			return "redirect:/";
		}

		return "admin/index";
	}
}