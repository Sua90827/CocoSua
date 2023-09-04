package com.suamall.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CartDetailInfoDTO;
import com.suamall.project.repository.CartRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	private final CartRepository repo;

	public List<CartDetailInfoDTO> getCartInfo(String user_id, int prdt_id) {
		//List<CartDetailInfoDTO> = repo.getCartInfo(user_id, prdt_id);
		return null;
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
