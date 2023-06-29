package com.suamall.project.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.MemberDTO;
import com.suamall.project.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/join")
	public String join() {
		return "user/member/join/step1";
	}
	
	@PostMapping("/join.do")
	public String join( @Valid MemberDTO dto, BindingResult br, Model model ) {
		String msg = "";
		if (br.hasErrors()) {
			msg="입력이 올바르지 않습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/join/step1";
		}
		msg = service.idCheck(dto);
		if(msg=="가입완료")	
		return "user/member/join/step2";
		else {
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/join/step1";
		}
	}
	
	@GetMapping("/login")
	public String login() {
		return "user/member/login";
	}
	
	@PostMapping("/login.do")
	public String login(Model model, MemberDTO dto) {
		String msg = service.getMsg(dto);
		if(msg!=null)
			return "user/member/login";
		return "redirect:/";
	}
}