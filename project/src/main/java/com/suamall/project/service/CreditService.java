package com.suamall.project.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suamall.project.dto.CartDTO;
import com.suamall.project.dto.CreditInfoDTO;
import com.suamall.project.dto.orderInfoView.OrderListDTO;
import com.suamall.project.dto.orderInfoView.ProductOrderDTO;
import com.suamall.project.repository.CreditRepository;

@Service
public class CreditService {
@Autowired
CreditRepository repo;
//public void getCreditDate() {
//	LocalDate now = LocalDate.now(ZoneId.of())
//}


public void insertCreditInfo(CreditInfoDTO dto) {
	if(dto.getRecipient_memo() == "") {
		dto.setRecipient_memo("없음");
	}
	try {
		repo.insertCreditInfo(dto);
	}catch(Exception e) {
		e.printStackTrace();
	}
}


public void updateDeleteCreditInfo(CreditInfoDTO dto) {
	String[] prdt_id = dto.getPrdt_id().split(",");	// 사용자가 구매한 데이터
	String[] prdt_amount = dto.getPrdt_amount().split(",");
	try {
		List<CartDTO> cart = repo.getPreviousAmount(dto); // DB에 저장된 데이터
		System.out.println("ppppppp"+cart);

		for(int i=0; i<cart.size(); i++) {
			for(int j=0; j<cart.size(); j++) {
				if(cart.get(i).getPrdt_id() == Integer.parseInt(prdt_id[j])) {
					if(cart.get(i).getCart_amount() > Integer.parseInt(prdt_amount[j])) {
						int setAmount = cart.get(i).getCart_amount() - Integer.parseInt(prdt_amount[j]);
						cart.get(i).setCart_amount(setAmount);
						repo.updateCartAmount(cart.get(i));
					}else {
						repo.deleteCartItem(cart.get(i));
					}
				}
			}
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
}


public List<OrderListDTO> dkdk(String id) {
	
	List<CreditInfoDTO> CreditInfoDTOList = repo.selectUserCreditInfo(id);
	
	List<ProductOrderDTO> prdtOrderDtoList = new ArrayList<>();
	List<OrderListDTO> orderList = new ArrayList<>();
	
	int cnt = 0;
	int sizeOft = 0;
	for(CreditInfoDTO t : CreditInfoDTOList) {
		String[] prdtId = t.getPrdt_id().split(",");
		String[] prdtAmount = t.getPrdt_amount().split(",");
		OrderListDTO OLD = new OrderListDTO();
		for (String pId : prdtId) {
			System.out.println(pId);
			ProductOrderDTO dto = repo.selectProductOrderInfo(pId);
			dto.setPrdt_amount(Integer.parseInt(prdtAmount[cnt]));
			cnt++;
			prdtOrderDtoList.add(sizeOft, dto);
		}cnt = 0;
		sizeOft++;
		
		OLD.setProductOrderDTO(prdtOrderDtoList);
		OLD.setCredit_id(t.getCredit_id());
		OLD.setUser_id(t.getUser_id());
		OLD.setCredit_price(t.getCredit_price());
		OLD.setCredit_way(t.getCredit_way());
		OLD.setOrder_nm(t.getOrder_nm());
		OLD.setOrder_phone_num(t.getOrder_phone_num());
		OLD.setOrder_email(t.getOrder_email());
		OLD.setOrder_state(t.getOrder_state());
		OLD.setRecipient_nm(t.getRecipient_nm());
		OLD.setRecipient_phone_num(t.getRecipient_phone_num());
		OLD.setRecipient_zip_code(t.getRecipient_zip_code());
		OLD.setRecipient_address(t.getRecipient_address());
		OLD.setRecipient_address_detail(t.getRecipient_address_detail());
		OLD.setRecipient_memo(t.getRecipient_memo());
		OLD.setCredit_date(t.getCredit_date());
		orderList.add(OLD);
	} 
	
	
	for(OrderListDTO old : orderList) {
		System.out.println("######################### 여기부터 orderList ###########################");
		List<ProductOrderDTO> productOrderDTO = old.getProductOrderDTO();
		for( ProductOrderDTO pod : productOrderDTO ) {
			System.out.println("*******여기는 prdtorderdto 시작*********");
			System.out.println(pod.getPrdt_id());
			System.out.println(pod.getCate_id());
			System.out.println(pod.getPrdt_nm());
			System.out.println(pod.getPrdt_img());
			System.out.println(pod.getPrdt_title());
			System.out.println(pod.getPrdt_color());
			System.out.println("*******여기는 prdtorderdto 끝*********");
		}
		
		System.out.println(old.getCredit_id());
		System.out.println(old.getUser_id());
		System.out.println(old.getCredit_price());
		System.out.println(old.getCredit_way());
		System.out.println(old.getOrder_nm());
		System.out.println(old.getOrder_phone_num());
		System.out.println(old.getOrder_email());
		System.out.println(old.getOrder_state());
		System.out.println(old.getRecipient_nm());
		System.out.println(old.getRecipient_phone_num());
		System.out.println(old.getRecipient_zip_code());
		System.out.println(old.getRecipient_address());
		System.out.println(old.getRecipient_address_detail());
		System.out.println(old.getRecipient_memo());
		System.out.println(old.getCredit_date());
		System.out.println("######################### 여기가 orderList 끝 ###########################");

	}
	
	return orderList;
}


}
