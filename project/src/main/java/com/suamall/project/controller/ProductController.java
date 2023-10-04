package com.suamall.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.dto.ReviewDTO;
import com.suamall.project.dto.WishListDTO;
import com.suamall.project.dto.adminProductListView.ProductListViewDTO;
import com.suamall.project.service.ProductService;

@Controller
public class ProductController {
	@Autowired 
	private ProductService service;
	@Autowired
	private HttpSession session;
	
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
		}List<ProductListViewDTO> list = service.getProductListView();
		
		model.addAttribute("prdt", list);

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
		List<Integer> prdtByCate = service.getPrdtByCate(cate_id);
		service.deletePrdtPics(prdtByCate);//
		service.deleteRelatedPrdt(cate_id);
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
		
		return "redirect:productList";
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
	public String userPrdtInfo(@RequestParam("prdt_id") int prdt_id,  Model model) {//HttpSession session,
		ProductListViewDTO dto = service.getCateColorNmByPrdtId(prdt_id);
		List<CategoryDTO> cate = service.getCategoryList();			// 카테고리 메뉴
		if(session.getAttribute("user_id") != null) {
			WishListDTO wish = service.chWishItem(prdt_id, (String)session.getAttribute("user_id"));
			model.addAttribute("wish", wish); 
		}
		List<ReviewDTO> review = service.getReviewList(prdt_id);
		model.addAttribute("cate", cate);
		model.addAttribute("prdt", dto);
		model.addAttribute("reviews", review);
		//해당 prdt_id, user_id로 wish db 조회해서 dto 넘겨줌.값이 없으면 wish list 에 등록되지 않은 상품임.
		return "user/shop/product/product_info";
	}
	
	private String getCateName(List<CategoryDTO> cate, int cate_id) {
		for(CategoryDTO dto : cate) {
			if(dto.getCate_id() == cate_id)
				return dto.getCate_nm();
		}
		return null;
	}
	
	@GetMapping("cateUpBtn")
	public String cateUpBtn(@RequestParam("cate_id") int cate_id, Model model) {
		int aboveCateId = service.selectAboveCateId(cate_id);
		CategoryDTO store = new CategoryDTO();
		store.setCate_id(cate_id);
		store.setChanged(aboveCateId);
		service.updateForMovingButtons(store);
		List<CategoryDTO> list = service.getCategoryList();
		service.swapCategoryIds(cate_id, aboveCateId);//카테고리 순서 변경시, 상품들도 변경되기 위해서.
		model.addAttribute("cate", list);
		return "admin/product/category_register";
	}
	
	@GetMapping("cateDownBtn")
	public String cateDownBtn(@RequestParam("cate_id") int cate_id, Model model) {
		int belowCateId = service.selectBelowCateId(cate_id);
		CategoryDTO store = new CategoryDTO();
		store.setCate_id(cate_id);
		store.setChanged(belowCateId);
		service.updateForMovingButtons(store);
		List<CategoryDTO> list = service.getCategoryList();
		service.swapCategoryIds(cate_id, belowCateId);//카테고리 순서 변경시, 상품들도 변경되기 위해서.
		model.addAttribute("cate", list);
		return "admin/product/category_register";
	}
	
	@GetMapping("prdtDelete.do")
	public String prdtDelete(@RequestParam("prdt_id") int prdt_id, Model model) {
		service.prdtDelete(prdt_id);
		return "redirect:productList";
	}
	
	@GetMapping("adminProductInfo")
	public String adminPrdtInfo(@RequestParam("prdt_id") int prdt_id, Model model) {
		ProductListViewDTO prdt = service.PrdtInfoByPrdtId(prdt_id);
		model.addAttribute("prdt", prdt);
		return "admin/product/product_view";
	}
	
	
	
	@PostMapping("insertWish")
	public String insertWish(WishListDTO dto) {
		service.insertWishItem(dto);
		return "redirect:userPrdtInfo?prdt_id="+dto.getPrdt_id();
	}
	
	@PostMapping("deleteWish")
	public String deleteWish(WishListDTO dto) {
		service.deleteWishItem(dto);
		return "redirect:userPrdtInfo?prdt_id="+dto.getPrdt_id();
	}
	@GetMapping("wishList")
	public String wishList(Model model) {
		List<ProductDTO> dto = service.selectWishItems((String) session.getAttribute("user_id"));
		model.addAttribute("prdt", dto);
		return "user/myPage/wish_list";
	}
}