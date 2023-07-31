package com.suamall.project.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.suamall.project.dto.KakaoMemberDTO;
import com.suamall.project.service.KakaoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class KakaoController {

	private final KakaoService service;


	@RequestMapping(value = "/login/kakao")
	public ModelAndView login(@RequestParam("code") String code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1번 인증코드 요청 전달"
		String accessToken = service.getAccessToken(code);
		// 2번 인증코드로 토큰 전달
		KakaoMemberDTO kakaoInput = new KakaoMemberDTO();
		try {
			kakaoInput = service.getUserInfo(accessToken);
		} catch (Exception e) {
			e.printStackTrace();
		}
		KakaoMemberDTO userInfo = service.getMember(kakaoInput.getMember_id());
		//stem.out.println("login info : " + userInfo.toString());
		System.out.println("userInfo ----> " + userInfo);
		
		if (userInfo != null) {  //이미 회원인 경우
			session.setAttribute("userId", userInfo.getMember_id());
			//session.setAttribute("accessToken", accessToken);
			session.setAttribute("loginType", userInfo.getMember_login_type());
			mav.setViewName("redirect:/");
			return mav;
		} 
		else {  //새로운 유저일 경우
			mav.addObject("member", kakaoInput);
			mav.setViewName("user/member/kakao_join/step1");
		return mav;
		}
	}
	
	@PostMapping("/kakao_join.do")
	public String Store(@Valid KakaoMemberDTO dto, BindingResult br, Model model ) {
		System.out.println("gdgd");
		String msg = "";
		if (br.hasErrors()) {
			msg="입력이 올바르지 않습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/kakao_join/step1";
		}
		msg = service.getJoinMsg(dto);
		if(msg=="가입완료")	
		return "redirect:/";
		else {
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/kakao_join/step1";
		}
	}

	@RequestMapping(value="/kakao_logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}

}
