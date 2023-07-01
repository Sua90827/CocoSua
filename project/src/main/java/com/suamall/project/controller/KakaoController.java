package com.suamall.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.suamall.project.dto.MemberDTO;
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
		MemberDTO userInfo = service.getUserInfo(accessToken);


		//stem.out.println("login info : " + userInfo.toString());

		if (userInfo != null) {
			session.setAttribute("userId", userInfo.getMember_id());
			//session.setAttribute("accessToken", accessToken);
			session.setAttribute("loginType", userInfo.getMember_login_type());
			
			mav.setViewName("redirect:/");
			return mav;
		} else {
			mav.addObject("member", userInfo);
			mav.setViewName("user/member/kakao_join/step1");

		return mav;
		}
	}

	@RequestMapping(value="/logout")

	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		service.kakaoLogout((String) session.getAttribute("accessToken"));
		session.removeAttribute("accessToken");
		session.removeAttribute("userId");
		mav.setViewName("index");
		return mav;
	}

}
