package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.ReviewDTO;

@Mapper
public interface ReviewRepository {

	int saveReview(ReviewDTO dto);

	List<ReviewDTO> getAllReview(int prdt_id);

	void deleteReview(int review_no);

}
