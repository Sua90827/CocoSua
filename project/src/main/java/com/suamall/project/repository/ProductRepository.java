package com.suamall.project.repository;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CategoryDTO;

@Mapper
public interface ProductRepository {

	CategoryDTO checkDB(CategoryDTO input);

	void cate_id(CategoryDTO input);

}
