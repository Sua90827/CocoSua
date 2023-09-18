package com.suamall.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suamall.project.repository.BoardRepository;

@Service
public class BoardService {
@Autowired BoardRepository repo;

}
