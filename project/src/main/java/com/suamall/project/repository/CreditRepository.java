package com.suamall.project.repository;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CreditInfoDTO;

@Mapper
public interface CreditRepository {

	void insertCreditInfo(CreditInfoDTO dto);


}
