package com.suamall.project.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeRepository {
	public void insertName(String name);
}
