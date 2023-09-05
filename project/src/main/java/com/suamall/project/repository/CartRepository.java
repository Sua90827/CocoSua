package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CartDetailInfoDTO;
import com.suamall.project.dto.CartInfoDTO;
import com.suamall.project.dto.ProductListViewDTO;

@Mapper
public interface CartRepository {

	List<CartInfoDTO> getCartInfo(String user_id);

	CartDTO cartSelect(CartDTO dto);

	void cartUpdate(CartDTO dto);

	void cartInsert(CartDTO dto);
	
}
