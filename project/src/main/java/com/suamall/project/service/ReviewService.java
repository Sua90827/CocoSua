package com.suamall.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suamall.project.dto.ReviewDTO;
import com.suamall.project.repository.ReviewRepository;

@Service
public class ReviewService {
@Autowired ReviewRepository repo;

//public List<ReviewDTO> getAllReview(int prdt_id) {
//	List<ReviewDTO> result = repo.getAllReview(prdt_id);
//	return result;
//}

}
