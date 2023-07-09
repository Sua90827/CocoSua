<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoSuaIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>CocoSua</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav_bar/product_nav.jsp"%>
<br>

<form action="productRegister.do" method="post" enctype="multipart/form-data">
	카테고리 : <select name="cate_id">
		<c:forEach var="category" items="${cate }">
			<option value="${category.cate_id }">${category.cate_nm }</option>
		</c:forEach>
	</select><br>
	제목 : <input type="text" name="prdt_title"><br>
	상품명 : <input type="text" name="prdt_nm"><br>
	내 용 : <input type="text" name="prdt_content"><br>
	색 상 : <select name="prdt_color">
		<c:forEach var="color" items="${color }">
			<option value="${color.color_id }">${color.color_nm }</option>
		</c:forEach>
	</select><br>
	가 격 : <input type="text" name="prdt_price"><br>
	수 량 : <input type="text" name="prdt_amount"><br>
	<input type="file" name="file"><br>
	<button type="submit">상품 등록</button> <input type="button" onclick="window.history.back()"value="뒤로가기">
	
	
</form>

</body>
</html>