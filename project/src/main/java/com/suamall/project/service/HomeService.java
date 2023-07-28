package com.suamall.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.repository.HomeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HomeService {
	
	private final HomeRepository repo;
	
	public void insertName(String name) {
		repo.insertName(name);
		
	}

	public List<ProductDTO> selectMini() {
		List<ProductDTO> dto = repo.selectAll(); 
		return dto;
		
	}

	public List<CategoryDTO> selectCate() {
		List<CategoryDTO> cate = repo.selectCate();
		return cate;
	}
	
}
