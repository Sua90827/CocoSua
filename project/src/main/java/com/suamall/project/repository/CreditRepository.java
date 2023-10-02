package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CreditInfoDTO;
import com.suamall.project.dto.orderInfoView.ProductOrderDTO;
import com.suamall.project.dto.orderInfoView.ReducingAmountDTO;
import com.suamall.project.dto.orderInfoView.ReviewCheckUpdateDTO;

@Mapper
public interface CreditRepository {

	void insertCreditInfo(CreditInfoDTO dto);

	List<CartDTO> getPreviousAmount(CreditInfoDTO dto);
	
	void updateCartAmount(CartDTO dto);
	
	void deleteCartItem(CartDTO dto);

	List<CreditInfoDTO> selectUserCreditInfo(String id);

	ProductOrderDTO selectProductOrderInfo(String id);

	void reducingPrdtAmount(ReducingAmountDTO dto);

	String getReviewCheck(int credit_id);

	void reviewCheckUpdate(ReviewCheckUpdateDTO dto);


}
