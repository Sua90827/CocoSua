package com.suamall.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CartDetailInfoDTO;
import com.suamall.project.dto.CartInfoDTO;
import com.suamall.project.dto.ProductListViewDTO;
import com.suamall.project.repository.CartRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	private final CartRepository repo;

	public List<CartInfoDTO> getCartInfo(String user_id) {
		List<CartInfoDTO> result = repo.getCartInfo(user_id);
		return result;
	}

	public void cartAdd(CartDTO dto) {
		CartDTO cartCheck = repo.cartSelect(dto);
		if(cartCheck != null) {
			repo.cartUpdate(dto);
		}else {
			repo.cartInsert(dto);
		}
	}
}
