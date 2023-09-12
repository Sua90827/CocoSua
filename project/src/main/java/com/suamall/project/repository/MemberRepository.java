package com.suamall.project.repository;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.MemberDTO;

@Mapper
public interface MemberRepository {

	public MemberDTO idCheck(String member_id);

	public void storeDTO(MemberDTO inputDTO);

	public void updateWithPw(MemberDTO dto);

	public void updateWithoutPw(MemberDTO dto);

	public void deleteMember(MemberDTO dto);

}
