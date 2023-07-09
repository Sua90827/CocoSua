package com.suamall.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.suamall.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	

}
