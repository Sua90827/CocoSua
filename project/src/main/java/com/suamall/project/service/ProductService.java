package com.suamall.project.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired 
	private ProductRepository repo;

	public String cateNmMsg(CategoryDTO input) {
		if(input.getCate_nm()==null || input.getCate_nm().equals("")) {
			return "카테고리명을 입력해주세요.";
		}		
		CategoryDTO db = new CategoryDTO();
		db=repo.checkDB(input);
		if(db!=null) {
			return "이미 존재하는 카테고리입니다.";
		}
		repo.cate_id(input);
		return null;
	}

	public List<ColorDTO> getColorList() {
		
		List<ColorDTO> color = repo.getColorList();
		
		return color;
	}

	public List<CategoryDTO> getCategoryList() {
		List<CategoryDTO> cate = repo.getCategoryList();
		return cate;
	}
	
	public String prdtInsert(MultipartHttpServletRequest multi) {
		//multi parameter 설정
		
		 int prdt_id = 0;       
		 int cate_id = Integer.parseInt(multi.getParameter("cate_id"));     
		 String prdt_nm = multi.getParameter("prdt_nm");   
		 String prdt_img;
		 String prdt_title=multi.getParameter("prdt_title");     
		 String prdt_content=multi.getParameter("prdt_content");  
		 String prdt_color=multi.getParameter("prdt_color");    
		 int prdt_price;  
		 int prdt_amount;   
		try {
			prdt_price=Integer.parseInt(multi.getParameter("prdt_price")); 
		} catch (Exception e) {
			return "금액을 올바르게 입력해주세요";
		}
		try {
			prdt_amount=Integer.parseInt(multi.getParameter("prdt_amount"));
		} catch (Exception e) {
			return "수량을 올바르게 입력해주세요";
		}
		
		//multi parameter 설정
		System.out.println(cate_id);
		System.out.println(prdt_nm);
		System.out.println(prdt_title);
		System.out.println(prdt_content);
		System.out.println(prdt_color);
		System.out.println(prdt_price);
		System.out.println(prdt_amount);
		
		int maxId = repo.getMaxId();
		prdt_id = maxId;
		if (prdt_id < 0) {
			return "상품 id를 입력하시오";
		} else if (cate_id < 0) {
			return "카테고리 id를 입력하시오.";
		} else if (prdt_nm == null) {
			return "상품 이름을 입력하시오.";
		} else if (prdt_title == null) {
			return "상품 설명을 입력하시오.";
		}else if (prdt_content == null) {
			return "상품 내용을 입력하시오.";
		}else if (prdt_color == null) {
			return "상품 색상을 입력하시오.";
		}else if (prdt_price < 0) {
			return "상품 가격을 입력하시오.";
		}else if (prdt_amount < 0) {
			return "상품 수량을 입력하시오.";
		}
		
		//~~~~~~~~~~~~~~~~img 파일 생성 및 img값 가져오는 곳
		
		MultipartFile file = multi.getFile("file");

		if (file == null || file.isEmpty()) {
			return "파일을 업로드해주세요.";
		}

		prdt_img = productImgSaveFile(file, maxId);
		
		//~~~~~~~~~~~~~~~~~img 파일 생성 및 img값 가져오는 곳
		
		ProductDTO dto = new ProductDTO();
		
		dto.setCate_id(cate_id);
		dto.setPrdt_amount(prdt_amount);
		dto.setPrdt_color(prdt_color);
		dto.setPrdt_content(prdt_content);
		dto.setPrdt_id(prdt_id);
		dto.setPrdt_img(prdt_img);
		dto.setPrdt_nm(prdt_nm);
		dto.setPrdt_price(prdt_price);
		dto.setPrdt_title(prdt_title);
		repo.insert(dto);

		return "성공";
	}
	
	public ProductDTO getPrdtInput(MultipartHttpServletRequest multi) {
		ProductDTO dto = new ProductDTO();
		dto.setPrdt_amount(Integer.parseInt(multi.getParameter("prdt_amount")));
		dto.setPrdt_content(multi.getParameter("prdt_content"));
		dto.setPrdt_nm(multi.getParameter("prdt_nm"));
		dto.setPrdt_price(Integer.parseInt(multi.getParameter("prdt_price")));
		dto.setPrdt_title(multi.getParameter("prdt_title"));
		return dto;
	}
	
	
	
	private String productImgSaveFile(MultipartFile file, int maxId) {
		String directory = "E:\\cocosua\\project\\project\\src\\main\\webapp\\resources\\upload\\";
		String originalName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar cal = Calendar.getInstance();
		String fileName = sdf.format(cal.getTime()) + originalName;
		String path = directory + maxId + "\\" + fileName;
		File targetFile = new File(path);
		if (targetFile.exists() == false) {
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	
}
