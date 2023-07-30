package com.suamall.project.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.dto.ProductListViewDTO;
import com.suamall.project.service.ProductService;

@Controller
public class ProductController {
	@Autowired 
	private ProductService service;
	
	
	@GetMapping("/productList")
	public String productlist(Model model) {
		List<ProductListViewDTO> list = service.getProductListView();
		
		model.addAttribute("prdt", list);
		return "admin/product/product_list";
	}
	
	@GetMapping("/productInfo")
	public String productInfo() {
		return "admin/product/product_view";
	}
	
	@GetMapping("/productRegister")
	public String productRegister(Model model) {
		List<ColorDTO> color = service.getColorList();
		List<CategoryDTO> cate = service.getCategoryList();
		
		model.addAttribute("color", color);
		model.addAttribute("cate", cate);
		
		return "admin/product/product_register";
	}
	
	@PostMapping("productRegister.do")
	public String productRegister(ProductDTO dto, Model model) {
		String msg = service.prdtInsert(dto);
		if(!msg.equals("성공")) {
			List<ColorDTO> color = service.getColorList();
			List<CategoryDTO> cate = service.getCategoryList();
			model.addAttribute("color", color); 
			model.addAttribute("cate", cate);
			model.addAttribute("product", dto);
			model.addAttribute("msg", msg);
			return "admin/product/product_register";
		}
		
		return "admin/product/product_list";
	}
	
	@GetMapping("/categoryRegister")
	public String categoryRegister(Model model) {
		List<CategoryDTO> list = service.getCategoryList();
		model.addAttribute("cate", list);
		return "admin/product/category_register";
	}
	
	@GetMapping("categoryDelete.do")
	public String categoryDelete(@RequestParam("cate_id") int cate_id, Model model) {
		service.CateDelete(cate_id);
		List<CategoryDTO> list = service.getCategoryList();
		model.addAttribute("cate", list);
		return "admin/product/category_register";
	}
	
	@PostMapping("/categoryRegister.do")
	public String categoryRegister(CategoryDTO input, Model model) {
		String msg = service.cateNmMsg(input);
		if(msg!=null) {
			List<CategoryDTO> list = service.getCategoryList();			
			model.addAttribute("msg", msg);
			model.addAttribute("cate", list);
			return "admin/product/category_register";
		}
		List<CategoryDTO> list = service.getCategoryList();
		model.addAttribute("cate", list);
		return "admin/product/category_register";
	}
	
	@GetMapping("/prdtUpdate")
	public String prdtUpdate(@RequestParam("prdt_id") int prdt_id , Model model) {
		ProductDTO prdt = service.getPrdtDTO(prdt_id);
		System.out.println(prdt.getPrdt_id() + " === " + prdt.getPrdt_img());
		List<CategoryDTO> cate = service.getCategoryList();
		List<ColorDTO> color = service.getColorList();
		
		model.addAttribute("prdt", prdt);
		model.addAttribute("cate", cate);
		model.addAttribute("color", color);
		
		return "admin/product/product_update";
	}
	
	@PostMapping("/prdtUpdate.do")
	public String prdtUpdate(ProductDTO dto, Model model) {
		String emptyCh = service.prdtUpdate(dto);
		if(!emptyCh.equals("완료")) {
			model.addAttribute("msg", emptyCh);
			ProductDTO prdt = service.getPrdtDTO(dto.getPrdt_id());
			model.addAttribute("prdt", prdt);
			List<CategoryDTO> cate = service.getCategoryList();
			List<ColorDTO> color = service.getColorList();
			model.addAttribute("cate", cate);
			model.addAttribute("color", color);
			return "admin/product/product_update";
		}
		return "redirect:productList";
	}
	
	
	@GetMapping("product_section")
	public String prdtList(@RequestParam("cate_id") int cate_id, Model model) {
		List<ProductDTO> dto = service.getAllByCateId(cate_id);		//
		List<CategoryDTO> cate = service.getCategoryList();			// 카테고리 메뉴
		String cateNm = getCateName(cate, cate_id);
		model.addAttribute("cate", cate);
		model.addAttribute("prdt", dto);
		model.addAttribute("cate_nm", cateNm);
		return "user/shop/shop_section";
	}
	
	@GetMapping("userPrdtInfo")
	public String userPrdtInfo(@RequestParam("prdt_id") int prdt_id, Model model) {
		ProductListViewDTO dto = service.getCateColorNmByPrdtId(prdt_id);
		List<CategoryDTO> cate = service.getCategoryList();			// 카테고리 메뉴
		model.addAttribute("cate", cate);
		model.addAttribute("prdt", dto);
		return "user/shop/product/product_info";
	}
	
	private String getCateName(List<CategoryDTO> cate, int cate_id) {
		for(CategoryDTO dto : cate) {
			if(dto.getCate_id() == cate_id)
				return dto.getCate_nm();
		}
		return null;
	}
	
	
	

}
