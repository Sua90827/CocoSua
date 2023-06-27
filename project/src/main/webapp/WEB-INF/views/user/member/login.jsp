<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/styles.css">
<title>suamall</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
	</c:if>
	<br>
	${msg }
	<br>
	<form action="login.do" method="post">
		<input type="text" name="member_id"><br>
		<input type="password" name="member_pw"><br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>