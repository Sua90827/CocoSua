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
					<th>update</th>
				</tr>
				<c:if test="${empty cate }">
					<tr>
						<td colspan="3" class="text_center" style="color: red">등록된
							카테고리가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="cate" items="${cate }">
					<tr>
						<td>${cate.cate_id }</td>
						<td>${cate.cate_nm }</td>
						<td><a href="#">등록</a> | <a href="#">삭제</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>