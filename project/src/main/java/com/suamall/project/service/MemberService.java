package com.suamall.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suamall.project.dto.MemberDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberRepository repo;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public String idCheck(MemberDTO inputDTO) {
		MemberDTO db = new MemberDTO();
		db= repo.idCheck(inputDTO.getMember_id());
		if(inputDTO.getMember_id()==null || inputDTO.getMember_id().equals(""))
			return "id를 입력하시오";
		if(db!=null)
			return "이미 있는 아이디입니다.";
		
		if(inputDTO.getMember_pw()==null || inputDTO.getMember_pw().equals(""))
			return "pw를 입력하시오";
		if(!(inputDTO.getMember_pw().equals(inputDTO.getMember_pwCheck())))
			return "pw가 다릅니다.";
		if(inputDTO.getMember_nm()==null || inputDTO.getMember_nm().equals(""))
			return "nm를 입력하시오";
		if(inputDTO.getMember_email()==null || inputDTO.getMember_email().equals(""))
			return "email를 입력하시오";
		if(inputDTO.getMember_birth() == 0)
			return "birthday를 입력하시오";
		if(inputDTO.getMember_phone_num()==null || inputDTO.getMember_phone_num().equals(""))
			return "phone number를 입력하시오";
		if(inputDTO.getMember_zip_code()==null || inputDTO.getMember_zip_code().equals(""))
			return "zip_code를 입력하시오";
		if(inputDTO.getMember_address()==null || inputDTO.getMember_address().equals(""))
			return "address를 입력하시오";
		if(inputDTO.getMember_address_detail()==null || inputDTO.getMember_address_detail().equals(""))
			return "address detail를 입력하시오";		

		if(db == null) {
			session.setAttribute("user_id", inputDTO.getMember_id());
			session.setAttribute("loginType", 0);
			session.setAttribute("cart_amount", 0);
			inputDTO.setMember_pw(passwordEncoder.encode(inputDTO.getMember_pw()));
			repo.storeDTO(inputDTO);
			return "가입완료";
		}
		
		return null;
	}

	public String getMsg(MemberDTO dto) {
		MemberDTO db = new MemberDTO();
		
		
		if(dto.getMember_id().equals("") || dto.getMember_id()==null) {
			return "아이디를 입력하시오";
		}
		if(dto.getMember_pw().equals("") || dto.getMember_pw()==null) {
			return "비밀번호를 입력하시오";
		}
		
		db= repo.idCheck(dto.getMember_id());
		
		if(db==null)
			return "회원이 아닙니다.";
		
		if(!(dto.getMember_id().equals( db.getMember_id()))) {
			return "아이디가 다릅니다.";
		}
		if(!(passwordEncoder.matches(dto.getMember_pw(), db.getMember_pw()))) {
			return "비밀번호가 일치하지 않습니다.";
		}
		int cart_amount = repo.getCartAmount(dto.getMember_id());
		session.setAttribute("user_id", dto.getMember_id());
		System.out.println("memberService loginType =======>"+ db.getMember_login_type());
		session.setAttribute("loginType", db.getMember_login_type());
		session.setAttribute("cart_amount", cart_amount);
		return null;
	}

	public MemberDTO getMemberInfo(String id) {
		MemberDTO memberInfo = repo.idCheck(id);
		return memberInfo;
	}


	public void updateWithPw(MemberDTO dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		repo.updateWithPw(dto);
	}

	public void updateWithoutPw(MemberDTO dto) {
		repo.updateWithoutPw(dto);
	}

	public String deleteMember(MemberDTO dto) {//session, cart, member 삭제 void 로 하면 안된다고 함.
		MemberDTO db = repo.idCheck(dto.getMember_id());
		if(passwordEncoder.matches(dto.getMember_pw(), db.getMember_pw())) {
			repo.cartdelete(dto.getMember_id());
			session.invalidate();
			repo.deleteMember(dto);
			return "탈퇴가 완료되었습니다";
		}
		return null;
	}

	public void kakaoMemberDelete(MemberDTO dto) {
		repo.cartdelete(dto.getMember_id());
		session.invalidate();
		repo.deleteMember(dto);
	}





}