package com.suamall.project.repository;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.KakaoMemberDTO;

@Mapper
public interface KakaoMemberRepository {
	
	public KakaoMemberDTO idCheck(String member_id);

	void storeDTO(KakaoMemberDTO input);

}
