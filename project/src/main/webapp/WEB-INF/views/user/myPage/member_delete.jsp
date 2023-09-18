<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/myDelete.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
<c:if test="${empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
	<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
</c:if>
<br>
<div align="center">
	<form action="memberDelete.do" method="post">
		<input type="hidden" value="${ member.member_id }" name="member_id">
		<table>
			<tr>
				<th>아이디</th>
				<td>${ member.member_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${ member.member_nm }</td>
			</tr>
			<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 2 }">
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="member_pw">
					</td>
				</tr>
			</c:if>
		</table>
		<button>탈퇴하기</button>
	</form>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>