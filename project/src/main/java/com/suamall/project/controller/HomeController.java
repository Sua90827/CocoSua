package com.suamall.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.HomeDTO;
import com.suamall.project.service.HomeService;

import lombok.RequiredArgsConstructor;

@Controller 
@RequiredArgsConstructor
public class HomeController {
	
	private final HomeService service;
	
	@GetMapping("/")
	public String main() {
		return "user/index";
	}
	
	@PostMapping("do.do")
	public String main(HomeDTO dto) {
		service.insertName(dto.getName());
		return "good";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "admin/index";
	}
}