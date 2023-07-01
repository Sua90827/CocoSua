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
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
	</c:if>
	<br> ${msg }
	<br>
	<form action="/login.do" method="post">
		<input type="text" name="member_id" value="${member.member_id }"><br>
		<input type="password" name="member_pw" value=${member.member_pw }><br>
		<button type="submit">로그인</button>
	</form>
	<a class="p-2"
		href="https://kauth.kakao.com/oauth/authorize?client_id=bb7ab199150e947c571829261362a621&redirect_uri=http://localhost:8080/login/kakao&response_type=code">
		<img src="resources/img/kakaoImg.png"
		style="height: 60px" />
	</a>
</body>
</html>