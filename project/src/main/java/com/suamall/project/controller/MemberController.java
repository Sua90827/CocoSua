package com.suamall.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.MemberDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.dto.WishListDTO;
import com.suamall.project.service.HomeService;
import com.suamall.project.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HomeService homeService;

	@Autowired
	private HttpSession session;

	@GetMapping("/join")
	public String join(Model model) {
		String userIdSession = (String) session.getAttribute("user_id");
		if (userIdSession == null) {
			return "user/member/join/step1";
		}
		List<ProductDTO> dto = homeService.selectMini();
		List<CategoryDTO> cate = homeService.selectCate();
		//System.out.println(cate.get(0).getCate_nm());
		model.addAttribute("prdt", dto);
		model.addAttribute("cate", cate);
		model.addAttribute("msg1", "z");
		return "user/index";
	}

	@PostMapping("/join.do")
	public String join(@Valid MemberDTO dto, BindingResult br, Model model) {
		String msg = "";
		if (br.hasErrors()) {
			msg = "입력이 올바르지 않습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/join/step1";
		}
		msg = service.idCheck(dto);
		if (msg == "가입완료")
			return "user/member/join/step2";
		else {
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/join/step1";
		}
	}

	@GetMapping("/login")
	public String login(Model model){
		String userIdSession = (String) session.getAttribute("user_id");
		if (userIdSession == null) {
			return "user/member/login";
		}
		List<ProductDTO> dto = homeService.selectMini();
		List<CategoryDTO> cate = homeService.selectCate();
		//System.out.println(cate.get(0).getCate_nm());
		model.addAttribute("prdt", dto);
		model.addAttribute("cate", cate);
		model.addAttribute("msg", "z");
		return "user/index";
	}

	@PostMapping("/login.do")
	public String login(MemberDTO dto, Model model) {
		System.out.println("gdgd");
		String msg = service.getMsg(dto);
		if (msg != null) {
			model.addAttribute("msg", msg);
			model.addAttribute("member", dto);
			return "user/member/login";
		}
		return "redirect:/";
	}

	@GetMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("myPage")
	public String myPage(Model model) {
		MemberDTO memberInfo = service.getMemberInfo((String) session.getAttribute("user_id"));
		model.addAttribute("member", memberInfo);
		return "user/myPage/index";
	}

	@GetMapping("memberModifyInfo")
	public String modifyInfo(Model model) {
		MemberDTO memberInfo = service.getMemberInfo((String) session.getAttribute("user_id"));
		model.addAttribute("member", memberInfo);
		return "user/myPage/member_update";
	}

	@PostMapping("modifyWithPw")
	public String updateWithPw(MemberDTO dto, Model model) {
		System.out.println("id" + dto.getMember_id());
		System.out.println("pw" + dto.getMember_pw());
		System.out.println("email" + dto.getMember_email());
		System.out.println("birth" + dto.getMember_birth());
		System.out.println("zip" + dto.getMember_zip_code());
		System.out.println("detail" + dto.getMember_address_detail());

		service.updateWithPw(dto);
		return "redirect:myPage";
	}

	@PostMapping("modifyWithoutPw")
	public String updateWithoutPw(MemberDTO dto, Model model) {
		System.out.println("id" + dto.getMember_id());
		System.out.println("pw" + dto.getMember_pw());
		System.out.println("email" + dto.getMember_email());
		System.out.println("birth" + dto.getMember_birth());
		System.out.println("zip" + dto.getMember_zip_code());
		System.out.println("detail" + dto.getMember_address_detail());

		service.updateWithoutPw(dto);
		return "redirect:myPage";
	}

	@GetMapping("memberDeleteInfo")
	public String getMemberDelete(Model model) {
		MemberDTO memberInfo = service.getMemberInfo((String) session.getAttribute("user_id"));
		model.addAttribute("member", memberInfo);
		return "user/myPage/member_delete";
	}

	@PostMapping("memberDelete.do") // cart, member 삭제
	public String memberDeleteInfo(MemberDTO dto, HttpServletResponse res) throws IOException {
		String result = service.deleteMember(dto);
		String msg = "";
		if (result != null) {
			msg += "<script>alert('" + result + "'); location.href='/';</script>";
			res.setContentType("text/html; charset=UTF-8");
			System.out.println(msg);
			PrintWriter out = res.getWriter();
			out.print(msg);
			out.flush();
		} else {
			msg += "<script>alert('비밀번호를 다시 확인해주세요.'); window.history.back();</script>";
			res.setContentType("text/html; charset=UTF-8");
			System.out.println(msg);
			PrintWriter out = res.getWriter();
			out.print(msg);
			out.flush();
		}
		return "redirect:/";
	}

	@GetMapping("kakaoMemberDelete.do")
	public String kakaoMemberDelete(MemberDTO dto, HttpServletResponse res) {
		service.kakaoMemberDelete(dto);
		return "redirect:/";
	}

}