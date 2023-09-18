package com.suamall.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.suamall.project.service.BoardService;

@Controller
public class BoardController {
@Autowired BoardService service;

}
