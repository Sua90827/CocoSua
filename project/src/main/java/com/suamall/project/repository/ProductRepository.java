package com.suamall.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.suamall.project.dto.CategoryDTO;
import com.suamall.project.dto.ColorDTO;
import com.suamall.project.dto.ProductDTO;
import com.suamall.project.dto.adminProductListView.ProductListViewDTO;

@Mapper
public interface ProductRepository {
	
	CategoryDTO checkDB(CategoryDTO input);

	void cate_id(CategoryDTO input);

	List<ColorDTO> getColorList();

	List<CategoryDTO> getCategoryList();

	int getMaxId();

	void productInsert(ProductDTO dto);

	public List<ProductDTO> selectAll();
	
	public String getCateName(int cate_id);

	List<ProductListViewDTO> getProductListView();

	public ProductDTO getPrdtDTO(int prdt_id);

	public void updateExceptFile(ProductDTO dto);

	public void updateIncludeFile(ProductDTO dto);

	List<ProductDTO> getAllByCateId(int cate_id);

	ProductListViewDTO getCateColorNmByPrdtId(int prdt_id);

	public void CateDelete(int cate_id);

	public int selectAboveCateId(int cate_id);

	public void updateForMovingButtons(CategoryDTO dto);

	public int selectBelowCateId(int cate_id);

	void prdtDelete(int prdt_id);
	
//	ColorDTO dto = new ColorDTO();
//	dto.setColor_id(1),
//	dto.setColor_nm("sjiod");
//	list.add(dto)

}
