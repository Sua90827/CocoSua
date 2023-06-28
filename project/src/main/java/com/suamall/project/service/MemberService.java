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
			return "id�� �Է��Ͻÿ�";
		if(db!=null)
			return "�̹� �ִ� ���̵��Դϴ�.";
		
		if(inputDTO.getMember_pw()==null || inputDTO.getMember_pw().equals(""))
			return "pw�� �Է��Ͻÿ�";
		if(!(inputDTO.getMember_pw().equals(inputDTO.getMember_pwCheck())))
			return "pw�� �ٸ��ϴ�.";
		if(inputDTO.getMember_nm()==null || inputDTO.getMember_nm().equals(""))
			return "nm�� �Է��Ͻÿ�";
		if(inputDTO.getMember_email()==null || inputDTO.getMember_email().equals(""))
			return "email�� �Է��Ͻÿ�";
		if(inputDTO.getMember_birth() == 0)
			return "birthday�� �Է��Ͻÿ�";
		if(inputDTO.getMember_phone_num()==null || inputDTO.getMember_phone_num().equals(""))
			return "phone number�� �Է��Ͻÿ�";
		if(inputDTO.getMember_zip_code()==null || inputDTO.getMember_zip_code().equals(""))
			return "zip_code�� �Է��Ͻÿ�";
		if(inputDTO.getMember_address()==null || inputDTO.getMember_address().equals(""))
			return "address�� �Է��Ͻÿ�";
		if(inputDTO.getMember_address_detail()==null || inputDTO.getMember_address_detail().equals(""))
			return "address detail�� �Է��Ͻÿ�";		

		if(db == null) {
			session.setAttribute("user_id", inputDTO.getMember_id());
			repo.storeDTO(inputDTO);
			return "���ԿϷ�";
		}
		
		return null;
	}

	public String getMsg(MemberDTO dto) {
		MemberDTO db = new MemberDTO();
		if(dto.getMember_id().equals("") || dto.getMember_id()==null) {
			return "id�� �Է��Ͻÿ�";
		}
		if(dto.getMember_pw().equals("") || dto.getMember_pw()==null) {
			return "pw�� �Է��Ͻÿ�";
		}
		if(!(dto.getMember_id().equals( db.getMember_id()))) {
			return "id�� �ٸ��ϴ�.";
		}
		if(!(dto.getMember_pw().equals( db.getMember_pw()))) {
			return "pw�� �ٸ��ϴ�.";
		}
		session.setAttribute("user_id", dto.getMember_id());
		return null;
	}
	
	
	
	
}
