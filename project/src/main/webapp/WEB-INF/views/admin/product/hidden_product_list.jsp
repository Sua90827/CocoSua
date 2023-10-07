<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav_bar/product_nav.jsp"%>
<br>



<div class="product_list_page">
	<div class="product_list_location">
	<div style="text-align:center;">
	<h3>Hidden Products</h3>
	</div>
		<table class="list_table">
			<tr>
				<th class="product_font_size">Num</th>
				<th class="product_font_size">Img</th>
				<th class="product_font_size">Name</th>
				<th class="product_font_size">Title</th>
				<th class="product_font_size">Color</th>
				<th class="product_font_size">Price</th>
				<th class="product_font_size">Amount</th>
				<th class="product_font_size">Category</th>
				<th class="product_font_size">Update&Delete</th>
			</tr>
			<c:if test="${empty hiddenList }">
				<tr>
					<td colspan="8" class="text_center" style="color:red">등록된 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="product" items="${hiddenList }">
				<tr>
					<td>${product.prdt_id }</td>
					<td><a href="adminProductInfo?prdt_id=${product.prdt_id }"><img class="img-fluid product_list_img_size" src="resources/upload/${product.prdt_id }/${product.prdt_img}"
								 alt="..." /></a></td>
					<td>${product.prdt_nm }</td>
					<td>${product.prdt_title }</td>
					<td>${product.color_nm }</td>
					<td>${product.prdt_price }</td>
					<td>${product.prdt_amount }</td>
					<td>${product.cate_nm }</td>
					<td>
					<a href="prdtUpdate?prdt_id=${product.prdt_id }"><button type="button" class="product_update_button">수정</button></a>
					<button type="button" class="product_delete_button abc" onclick="productDelete(${product.prdt_id});">삭제</button>
					<button type="button" class="product_hide_button abc" onclick="productDisplay(${product.prdt_id});">보이기</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
	function productDelete(id){
		var prdtId = id;
		if (window.confirm('상품을 삭제하시겠습니까?'))
		{
		    location.href="prdtDelete.do?prdt_id=" + prdtId;
		}
		else
		{
		    return;
		}
	}
	
	function productDisplay(id){
		var prdtId = id;
		if (window.confirm('상품을 사용자에게 보이도록 하겠습니까?'))
		{
		    location.href="productDisplay.do?prdt_id=" + prdtId;
		}
		else
		{
		    return;
		}
	}
</script>

<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>