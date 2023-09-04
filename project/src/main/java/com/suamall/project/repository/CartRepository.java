package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CartDetailInfoDTO;

@Mapper
public interface CartRepository {

	List<CartDetailInfoDTO> getCartInfo(String user_id, int prdt_id);

	CartDTO cartSelect(CartDTO dto);

	void cartUpdate(CartDTO dto);

	void cartInsert(CartDTO dto);
	
}
