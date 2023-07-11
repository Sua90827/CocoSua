package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;

@Mapper
public interface ProductRepository {

	CategoryDTO checkDB(CategoryDTO input);

	void cate_id(CategoryDTO input);

	List<ColorDTO> getColorList();

	List<CategoryDTO> getCategoryList();

	int getMaxId();

	void insert(ProductDTO dto);
	
//	ColorDTO dto = new ColorDTO();
//	dto.setColor_id(1),
//	dto.setColor_nm("sjiod");
//	list.add(dto)

}
