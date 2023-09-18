<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/myPage.css">
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
<input type="hidden" value="${ member.member_phone_num }" id="memberPhone">
<div align="center">
	<div style="width: 600px; display: flex; justify-content:space-between;">
		
		<div style="width:25%">
			<a class="itemsList" href="orderList">구매목록</a>
		</div>
		
		
		<div style="width:25%">
			<a class="itemsList" href="memberModifyInfo">회원수정</a>
		</div>
		
		<c:if test="${ sessionScope.loginType eq 1 }">
			<div style="width:25%">
				<a class="itemsList" onclick="kakaoMemberDelete('${sessionScope.user_id}');">회원탈퇴</a>
			</div>
		</c:if>
				
		<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 2 }">
			<div style="width:25%"> 
				<a class="itemsList" href="memberDeleteInfo">회원탈퇴</a>
			</div>
		</c:if> 
		
		<div style="width:25%">
			<a class="itemsList wishList" href="wishList">위시리스트</a>
		</div>
		
	</div>
</div>
<div align="center">
	<div style="width:600px; text-align: left;">
		<span style="font-weight:bold;">${member.member_nm }</span> <span style="color:gray; font-weight:bold;">님 환영합니다.</span>
	</div>
	<table>
		<tr>
			<th style="width:100px;">아이디</th>
			<td style="width: 150px;">${ member.member_id }</td>
			<th style="width:100px;">이메일</th>
			<td style="width: 250px;">${ member.member_email }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${ member.member_birth }</td>
			<th>핸드폰</th>
			<td><span id="userPhone"></span></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3">${ member.member_address } ${ member.member_address_detail }</td>
		</tr>
	</table>
	
</div>
<script src="resources/js/mypage_index.js"></script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>

</body>
</html>