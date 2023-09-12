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
<c:if test="${empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
	<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
</c:if>
<br>
<input type="hidden" value="${ member.member_phone_num }" id="memberPhone">
<a href="memberModifyInfo">회원수정</a>
<c:if test="${ sessionScope.loginType eq 1 }">
	<a onclick="kakaoMemberDelete('${sessionScope.user_id}');">회원탈퇴</a>
</c:if>
<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 2 }"> 
	<a href="memberDeleteInfo">회원탈퇴</a>
</c:if> 
<a href="orderList">구매목록</a>
<div align="center">
	${member.member_nm } 님 환영합니다.
	<table>
		<tr>
			<th>아이디</th>
			<td>${ member.member_id }</td>
			<th>이메일</th>
			<td>${ member.member_email }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${ member.member_birth }</td>
			<th>핸드폰</th>
			<td><span id="userPhone"></span></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${ member.member_address } ${ member.member_address_detail }</td>
			<th></th>
			<td></td>
		</tr>
	</table>
	
</div>
<script src="resources/js/mypage_index.js"></script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>

</body>
</html>