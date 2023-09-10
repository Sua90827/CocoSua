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
	<c:if test="${ empty sessionScope.loginType }">
		<%@ include file="../../nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="../../nav_bar/user_nav.jsp"%>
	</c:if>
	<div align="center">
		<h1>상품 주문이 완료되었습니다.</h1>
		<a href="/">쇼핑하기</a><a href="orderList">구매목록</a>
	</div>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>