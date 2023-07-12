<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>CocoSua</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav_bar/product_nav.jsp"%>
<br>

<div class="product_list_page">
	<div class="product_list_location">
	
		<table class="list_table">
			<tr>
				<th class="product_font_size">Num</th>
				<th class="product_font_size">Category</th>
				<th class="product_font_size">Name</th>
				<th class="product_font_size">Img</th>
				<th class="product_font_size">Title</th>
				<th class="product_font_size">Color</th>
				<th class="product_font_size">Price</th>
				<th class="product_font_size">Amount</th>
			</tr>
			<c:if test="${empty prdt }">
				<tr>
					<td colspan="8" class="text_center" style="color:red">등록된 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="product" items="${prdt }">
				<tr>
					<td>${product.prdt_id }</td>
					<td>${product.cate_nm }</td>
					<td>${product.prdt_nm }</td>
					<td>${product.prdt_img }</td>
					<td>${product.prdt_title }</td>
					<td>${product.color_nm }</td>
					<td>${product.prdt_price }</td>
					<td>${product.prdt_amount }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</div>


<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>