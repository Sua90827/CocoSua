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
	//int orderListCnt = 0;
	int cnt = 0;
	List<CreditInfoDTO> CreditInfoDTOList = repo.selectUserCreditInfo(id);
	List<ProductOrderDTO> prdtOrderDtoList = new ArrayList<>();
	List<OrderListDTO> orderList = new ArrayList<>();
	for(CreditInfoDTO t : CreditInfoDTOList) {
		String[] prdtId = t.getPrdt_id().split(",");
		String[] prdtAmount = t.getPrdt_amount().split(",");
		
		for (String pId : prdtId) {
			System.out.println(pId);
			ProductOrderDTO dto = repo.selectProductOrderInfo(pId);
			dto.setPrdt_amount(Integer.parseInt(prdtAmount[cnt]));
			cnt++;
			prdtOrderDtoList.add(dto);
		}
		//CreditInfoDTOList
		cnt = 0;
	} 
	
	
	return orderList;
}


}
