package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CreditInfoDTO;

@Mapper
public interface CreditRepository {

	void insertCreditInfo(CreditInfoDTO dto);

	List<CartDTO> getPreviousAmount(CreditInfoDTO dto);
	
	void updateCartAmount(CartDTO dto);
	
	void deleteCartItem(CartDTO dto);


}
