package com.suamall.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired 
	private ProductRepository repo;

	public String cateNmMsg(CategoryDTO input) {
		if(input.getCate_nm()==null || input.getCate_nm().equals("")) {
			return "카테고리명을 입력해주세요.";
		}		
		CategoryDTO db = new CategoryDTO();
		db=repo.checkDB(input);
		if(db!=null) {
			return "이미 존재하는 카테고리입니다.";
		}
		repo.cate_id(input);
		return null;
	}

	public List<ColorDTO> getColorList() {
		
		List<ColorDTO> color = repo.getColorList();
		
		return color;
	}

	public List<CategoryDTO> getCategoryList() {
		List<CategoryDTO> cate = repo.getCategoryList();
		return null;
	}
}
