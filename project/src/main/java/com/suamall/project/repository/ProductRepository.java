package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;

@Mapper
public interface ProductRepository {

	CategoryDTO checkDB(CategoryDTO input);

	void cate_id(CategoryDTO input);

	List<ColorDTO> getColorList();

	List<CategoryDTO> getCategoryList();
	
//	ColorDTO dto = new ColorDTO();
//	dto.setColor_id(1),
//	dto.setColor_nm("sjiod");
//	list.add(dto)

}
