package com.suamall.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.HomeDTO;
import com.suamall.project.service.HomeService;

import lombok.RequiredArgsConstructor;

@Controller 
public class HomeController {
	@Autowired
	private HomeService service;
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	@PostMapping("do.do")
	public String main(HomeDTO dto) {
		service.insertName(dto.getName());
		return "good";
	}
}