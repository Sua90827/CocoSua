<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoSuaIcon.png" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>CocoSua</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/nav_bar/product_nav.jsp"%>
	<br>
	<div class="category_page">
		<div class="category_location">
			<form action="/categoryRegister.do" method="post">
				<table class="category_table">
					<tr>
						<td>카테고리</td>
						<td><input name="cate_nm"></td>
						<td><button type="submit">등록</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<div class="category_page">
		<div class="category_location">
			<table class="list_table">
				<tr>
					<th>Num</th>
					<th>Name</th>
					<th>delete</th>
					<th></th>
				</tr>
				<c:if test="${empty cate }">
					<tr>
						<td colspan="3" class="text_center" style="color: red">등록된 카테고리가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="cate" items="${cate }">
					<tr>
						<td>${cate.cate_id }</td>
						<td>${cate.cate_nm }</td>
						<td><button class="cateDeleteBtn" type="button" onclick="categoryDelete(${cate.cate_id})">삭제</button></td>
						<td><a href="cateUpBtn?cate_id=${cate.cate_id }"><button class="cateUpBtn">▲</button></a>  <a href="cateDownBtn?cate_id=${cate.cate_id }"><button class="cateDownBtn">▼</button></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
		function categoryDelete(id){
			var cateId = id;
			if(window.confirm('삭제하게 되면 카테고리 관련된 모든 상품도 삭제됩니다. 카테고리를 삭제하시겠습니까?')){
				location.href="categoryDelete.do?cate_id=" + cateId;	
			}else
			return;
		}
	</script>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>