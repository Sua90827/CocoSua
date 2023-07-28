package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ProductDTO;

@Mapper
public interface HomeRepository {
	public void insertName(String name);

	public List<ProductDTO> selectAll();

	public List<CategoryDTO> selectCate();
}
