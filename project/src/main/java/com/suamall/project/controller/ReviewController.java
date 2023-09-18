package com.suamall.project.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suamall.project.dto.ReviewDTO;
import com.suamall.project.service.ReviewService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ReviewController {
@Autowired ReviewService service;
	
//	@GetMapping("review_list")
//	public String board(@RequestParam int prdt_id) {
//		List<ReviewDTO> reviewList = service.getAllReview(prdt_id);
//		
//		return "user/board/review_list";
//	}
	
	@GetMapping("writingReview")
	public String writingReview(ReviewDTO dto, Model model) {
		model.addAttribute("dto", dto);
		System.out.println("prdt_id=***************>"+dto.getPrdt_id());
		System.out.println("prdt_nm=***************>"+dto.getPrdt_nm());
		System.out.println("prdt_color=***************>"+dto.getPrdt_color());
		System.out.println("prdt_title=***************>"+dto.getPrdt_title());
		return "user/board/review_form";
	}
	
	@PostMapping("writeSave")
	public String writeSave(ReviewDTO dto) {
		
	}
}
