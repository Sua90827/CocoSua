package com.suamall.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.PaymentDetailInfoDTO;
import com.suamall.project.dto.CartInfoDTO;
import com.suamall.project.dto.MemberDTO;
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

	public void delete(String user_id, int prdt_id) {
		CartDTO dto = new CartDTO();
		dto.setPrdt_id(prdt_id);
		dto.setUser_id(user_id);
		repo.cartDelete(dto);
	}

	public MemberDTO getUserInfo(String user_id) {
		MemberDTO result = repo.getUserInfo(user_id);
		return result;
	}

	public List<CartInfoDTO> updateCart(List<CartInfoDTO> cart, String cart_id, String cart_amount) {
		String[] cartId = cart_id.split(",");
		String[] cartAmount = cart_amount.split(",");
		int size = cart.size();
		
		for(int i = 0; i < size; ++i) {
			for(int j = 0; j < size; ++j) {
				if(Integer.parseInt(cartId[i]) == cart.get(j).getCart_id()) {
					cart.get(j).setCart_amount(Integer.parseInt(cartAmount[i]));
					int cart_price = cart.get(j).getCart_amount() * cart.get(j).getPrdt_price();
					cart.get(j).setCart_price(cart_price);
				}
			}
		}
		return cart;
	}
}
