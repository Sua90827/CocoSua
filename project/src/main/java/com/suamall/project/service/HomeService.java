package com.suamall.project.service;

import org.springframework.stereotype.Service;

import com.suamall.project.repository.HomeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HomeService {
	
	private final HomeRepository repo;
	
	public void insertName(String name) {
		repo.insertName(name);
		
	}
	
}
