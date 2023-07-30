package com.suamall.project.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.dto.ProductListViewDTO;
import com.suamall.project.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired 
	private ProductRepository repo;
	private static String directory = "E:\\cocosua\\project\\project\\src\\main\\webapp\\resources\\upload\\";

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
	
	public String prdtInsert(ProductDTO dto) {
		//multi parameter 설정
		
		String msg = insertEmptyCh(dto);
		
		if(!msg.equals("검증 완료")) {
			return "실패";
		}
		
		

		
		//~~~~~~~~~~~~~~~~img 파일 생성 및 img값 가져오는 곳
		
		MultipartFile file = dto.getFile();

		if (file == null || file.isEmpty()) {
			return "파일을 업로드해주세요.";
		}
		
		int maxId = repo.getMaxId();

		String prdt_img = productImgSaveFile(file, maxId);
		
		//~~~~~~~~~~~~~~~~~img 파일 생성 및 img값 가져오는 곳
		
		dto.setPrdt_id(maxId);
		dto.setPrdt_img(prdt_img);

		repo.productInsert(dto);

		return "성공";
	}
	
//	public ProductDTO getPrdtInput(MultipartHttpServletRequest multi) {//뷰에 남기기 위한 애들
//		ProductDTO dto = new ProductDTO();
//		dto.setPrdt_amount(Integer.parseInt(multi.getParameter("prdt_amount")));
//		dto.setCate_id(Integer.parseInt(multi.getParameter("cate_id")));
//		dto.setPrdt_color(Integer.parseInt(multi.getParameter("prdt_color")));
//		dto.setPrdt_content(multi.getParameter("prdt_content"));
//		dto.setPrdt_nm(multi.getParameter("prdt_nm"));
//		dto.setPrdt_price(Integer.parseInt(multi.getParameter("prdt_price")));
//		dto.setPrdt_title(multi.getParameter("prdt_title"));
//		return dto;
//	}
	
	
	
	

	public List<ProductDTO> selectAll() {
		List<ProductDTO> dto = repo.selectAll();
		return dto;
	}
	
	public String getCateName(int cate_id) {
		String cate_nm = repo.getCateName(cate_id);
		return cate_nm;
	}

	public List<ProductListViewDTO> getProductListView() {
		List<ProductListViewDTO> list = repo.getProductListView();
		return list;
	}

	public ProductDTO getPrdtDTO(int prdt_id) {
		ProductDTO prdt=repo.getPrdtDTO(prdt_id);
		return prdt;
	}

	public String prdtUpdate(ProductDTO dto) {
		String msg = updateEmptyCh(dto);
		if(!msg.equals("검증 완료")) {
			return msg;
		}
		
		MultipartFile file = dto.getFile();

		if (file == null || file.isEmpty()) {
			repo.updateExceptFile(dto);
			return "완료";
		}
		
		int prdtId = dto.getPrdt_id();
		
		folderDelete(prdtId);
		
		String prdt_img = productImgSaveFile(file, prdtId);
		
		//~~~~~~~~~~~~~~~~~img 파일 생성 및 img값 가져오는 곳
		
		
		dto.setPrdt_img(prdt_img);
		repo.updateIncludeFile(dto);
		return "완료";
	}

	private String insertEmptyCh(ProductDTO dto) {
		if (dto.getPrdt_id() < 0) {
			return "상품 id를 입력하시오";
		} else if (dto.getCate_id() < 0) {
			return "카테고리 id를 입력하시오.";
		} else if (dto.getPrdt_nm() == null || dto.getPrdt_nm().equals("")) {
			return "상품 이름을 입력하시오.";
		} else if (dto.getPrdt_title() == null|| dto.getPrdt_title().equals("")) {
			return "상품 설명을 입력하시오.";
		}else if (dto.getPrdt_content() == null || dto.getPrdt_content().equals("")) {
			return "상품 내용을 입력하시오.";
		}else if (dto.getPrdt_color() < 0) {
			return "상품 색상을 입력하시오.";
		}else if (dto.getPrdt_price() < 0) {
			return "상품 가격을 입력하시오.";
		}else if (dto.getPrdt_amount() < 0) {
			return "상품 수량을 입력하시오.";
		}return "검증 완료";
	}
	
	private String updateEmptyCh(ProductDTO dto) {
		if (dto.getCate_id() < 0) {
			return "카테고리를 선택하시오.";
		}  else if (dto.getPrdt_nm() == null || dto.getPrdt_nm().equals("")) {
			return "상품 이름을 입력하시오.";
		} else if (dto.getPrdt_title() == null|| dto.getPrdt_title().equals("")) {
			return "상품 설명을 입력하시오.";
		}else if (dto.getPrdt_content() == null || dto.getPrdt_content().equals("")) {
			return "상품 내용을 입력하시오.";
		}else if (dto.getPrdt_color() < 0) {
			return "상품 색상을 선택하시오.";
		}else if (dto.getPrdt_price() < 0) {
			return "상품 가격을 입력하시오.";
		}else if (dto.getPrdt_amount() < 0) {
			return "상품 수량을 입력하시오.";
		}return "검증 완료";
	}   
	
	private String productImgSaveFile(MultipartFile file, int maxId) {
		
		String originalName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar cal = Calendar.getInstance();
		String fileName = sdf.format(cal.getTime()) + originalName;
		String path = directory + maxId + "\\" + fileName;
		System.out.println(path);
		File targetFile = new File(path); //경로 설정
		if (targetFile.exists() == false) {
			targetFile.mkdirs(); //경로에 폴더가 없으면 폴더 생성
		}
		try {
			file.transferTo(targetFile); //파일 생성
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	private void folderDelete(int prdt_id) {
		String path = directory + prdt_id;
		File folder = new File(path);
		try {
			while (folder.exists()) {
				File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기
				for (int j = 0; j < folder_list.length; j++) {
					folder_list[j].delete(); // 파일 삭제
				}
				if (folder_list.length == 0 && folder.isDirectory()) {
					folder.delete();	//폴더 삭제
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<ProductDTO> getAllByCateId(int cate_id) {
		List<ProductDTO> prdtByCateId = repo.getAllByCateId(cate_id);
		return prdtByCateId;
	}

	public ProductListViewDTO getCateColorNmByPrdtId(int prdt_id) {
		ProductListViewDTO aw = repo.getCateColorNmByPrdtId(prdt_id);
		return aw;
	}
	
	
}
