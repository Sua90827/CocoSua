package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.MemberDTO;
import com.suamall.project.dto.ProductDTO;

@Mapper
public interface MemberRepository {

	public MemberDTO idCheck(String member_id);

	public void storeDTO(MemberDTO inputDTO);

	public void updateWithPw(MemberDTO dto);

	public void updateWithoutPw(MemberDTO dto);

	public void deleteMember(MemberDTO dto);

	public void cartdelete(String member_id);

	public int getCartAmount(String member_id);


}
