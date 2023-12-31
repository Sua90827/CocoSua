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
<div class="product_page">
	<div class="product_location">
	
		${msg }
		<form action="prdtUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="prdt_id" value="${prdt.prdt_id }">
			<table class="product_table">
					<tr>
						<td>카테고리</td>
						<td><select name="cate_id">
						<c:forEach var="category" items="${cate }">
							<option value="${category.cate_id }" ${prdt.cate_id == category.cate_id ? 'selected="selected"' : '' }>${category.cate_nm }</option>
						</c:forEach>
					</select></td>
					</tr>
					<tr>
						<td>제 목</td>
						<td><input type="text" name="prdt_title" value="${prdt.prdt_title }"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="prdt_nm" value="${prdt.prdt_nm }"></td>
					</tr>
					<tr>
						<td>내 용</td>
						<td><textarea style="width:500px; height:300px; " name="prdt_content">${ prdt.prdt_content }</textarea></td>
					</tr>
					<tr>
						<td>색 상</td>
						<td>
							<select name="prdt_color">
								<c:forEach var="color" items="${color }">
									<option value="${color.color_id }" ${prdt.prdt_color == color.color_id ? 'selected="selected"' : '' }>${color.color_nm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>가 격</td>
						<td><input type="text" name="prdt_price" value="${prdt.prdt_price }"></td>
					</tr>
					<tr>
						<td>재 고</td>
						<td><input type="text" name="prdt_amount" value="${prdt.prdt_amount }"></td>
					</tr>
				</table>
				<div>
					<div align="center" style="padding-top:30px;">
						<a onclick="fileSelect();"><img class = "img-fluid product_list_img_size" id="userImgFile"style="width: 130px;" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." /></a>
						<a onclick="fileSelect();"><img class="img-fluid product_list_img_size" id="preview" alt="Preview"/></a>
					</div>
				</div>
				<br><br>
				<div class="product_file">
					<input type="file" name="file" id="file" style="display:none;" onchange="previewImage(event);">
				</div>
				<div class="product_botton">
					<button type="submit">상품 수정</button> <button type="reset" class="resume_person_info_save_button" id="cancelButton" onclick="fileCancel()"><b>취소</b></button>
				</div>
		</form>
	</div>
</div>

<script src="/resources/js/product_update.js"></script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>