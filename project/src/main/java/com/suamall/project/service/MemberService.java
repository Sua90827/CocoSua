package com.suamall.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suamall.project.dto.MemberDTO;
import com.suamall.project.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberRepository repo;
	
	@Autowired
	private HttpSession session;

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
		if(!(dto.getMember_pw().equals( db.getMember_pw()))) {
			return "비밀번호가 일치하지 않습니다.";
		}
		session.setAttribute("user_id", dto.getMember_id());
		session.setAttribute("loginType", db.getMember_login_type());
		return null;
	}
	
	
	
	
}