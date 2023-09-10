package com.suamall.project.service;

import java.time.LocalDate;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suamall.project.dto.CreditInfoDTO;
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


}
